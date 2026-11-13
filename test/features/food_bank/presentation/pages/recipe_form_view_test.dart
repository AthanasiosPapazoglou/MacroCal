import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_form_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/recipe_form_view.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/ingredient_picker.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/recipe_ingredient_row.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_ingredients.dart';

class _MockRecipeFormCubit extends Mock implements RecipeFormCubit;

void main() {
  late RecipeFormCubit cubit;
  late CubitStub<RecipeFormState> stub;

  const ready = RecipeFormState(
    status: RecipeFormStatus.ready,
    ingredients: [sampleMilk, sampleBread],
  );
  final withMilk = ready.copyWith(
    items: const [RecipeIngredient(ingredient: sampleMilk, grams: 200)],
  );

  setUp(() {
    cubit = _MockRecipeFormCubit();
    stub = CubitStub(cubit, ready);
    when(() => cubit.isEdit).thenReturn(false);
    when(() => cubit.save(any())).thenAnswer((_) async {});
  });

  Future<void> pumpView(WidgetTester tester) => pumpLocalized(
    tester,
    router: GoRouter(
      initialLocation: AppRoutes.newRecipe,
      routes: [
        GoRoute(
          path: AppRoutes.foods,
          builder: (_, _) => const Text('food bank'),
          routes: [
            GoRoute(
              path: 'recipes/new',
              builder: (_, _) => BlocProvider.value(
                value: cubit,
                child: const RecipeFormView(),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  testWidgets('the picker searches the ingredients and adds the tapped one', (
    tester,
  ) async {
    await pumpView(tester);
    expect(find.text('New Recipe'), findsOneWidget);

    await tester.tap(find.text('Add ingredient'));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.descendant(
        of: find.byType(IngredientPicker),
        matching: find.byType(TextField),
      ),
      'bread',
    );
    await tester.pumpAndSettle();

    expect(find.text('Milk 1.5%'), findsNothing);
    await tester.tap(find.text('Whole Bread'));
    await tester.pumpAndSettle();

    verify(() => cubit.addIngredient(sampleBread)).called(1);
    expect(find.byType(IngredientPicker), findsNothing);
  });

  testWidgets('a picked ingredient focuses its grams field', (tester) async {
    when(() => cubit.addIngredient(sampleBread)).thenAnswer(
      (_) => stub.emit(
        ready.copyWith(
          items: const [RecipeIngredient(ingredient: sampleBread, grams: 0)],
        ),
      ),
    );
    await pumpView(tester);
    await tester.tap(find.byType(TextFormField).first);
    await tester.pump();

    await tester.tap(find.text('Add ingredient'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Whole Bread'));
    await tester.pumpAndSettle();

    final grams = tester.widget<EditableText>(
      find.descendant(
        of: find.byType(RecipeIngredientRow),
        matching: find.byType(EditableText),
      ),
    );
    expect(grams.focusNode.hasFocus, isTrue);
  });

  testWidgets('a row edits its grams and removes its ingredient', (
    tester,
  ) async {
    stub.emit(withMilk);
    await pumpView(tester);

    expect(find.text('Milk 1.5%'), findsOneWidget);
    expect(find.text('200'), findsOneWidget);

    await tester.enterText(
      find.descendant(
        of: find.byType(RecipeIngredientRow),
        matching: find.byType(TextField),
      ),
      '150',
    );
    await tester.tap(find.byIcon(Icons.close_rounded));

    verify(() => cubit.updateGrams(sampleMilk.id, 150)).called(1);
    verify(() => cubit.removeIngredient(sampleMilk.id)).called(1);
  });

  testWidgets('the totals use the final weight, which the form reports', (
    tester,
  ) async {
    stub.emit(withMilk.copyWith(finalWeightGrams: 100));
    await pumpView(tester);

    expect(find.text('100 gr. in total'), findsOneWidget);
    expect(find.text('90'), findsOneWidget);
    expect(find.text('6.4 gr.'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).last, '400');

    verify(() => cubit.updateFinalWeight(400)).called(1);
  });

  testWidgets('saving shows a missing name and missing ingredients', (
    tester,
  ) async {
    await pumpView(tester);

    await tester.tap(find.text('Save'));
    await tester.pump();

    expect(find.text('Enter a recipe name'), findsOneWidget);
    verify(() => cubit.save('')).called(1);

    stub.emit(ready.copyWith(status: RecipeFormStatus.missingIngredients));
    await tester.pump();

    expect(
      find.text('Add at least one ingredient with its grams'),
      findsOneWidget,
    );
  });

  testWidgets('editing fills the form with the recipe', (tester) async {
    when(() => cubit.isEdit).thenReturn(true);
    stub.emit(withMilk.copyWith(name: 'Warm milk', finalWeightGrams: 180));
    await pumpView(tester);

    expect(find.text('Edit Recipe'), findsOneWidget);
    expect(find.text('Warm milk'), findsOneWidget);
    expect(find.text('200'), findsOneWidget);
    expect(find.text('180'), findsOneWidget);
  });

  testWidgets('a saved recipe returns to the food bank', (tester) async {
    await pumpView(tester);

    await tester.enterText(find.byType(TextFormField).first, 'Warm milk');
    await tester.tap(find.text('Save'));
    await tester.pump();

    verify(() => cubit.save('Warm milk')).called(1);

    stub.emit(ready.copyWith(status: RecipeFormStatus.saved));
    await tester.pumpAndSettle();

    expect(find.text('food bank'), findsOneWidget);
  });
}
