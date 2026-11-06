import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/product_lookup_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_field.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_state.dart';

class IngredientFormCubit extends Cubit<IngredientFormState> {
  new(
    this._ingredientRepository,
    this._productLookupRepository, {
    this.ingredientId,
  }) : super(const IngredientFormState());

  static const _milligramsPerGram = 1000;

  final IngredientRepository _ingredientRepository;
  final ProductLookupRepository _productLookupRepository;
  final int? ingredientId;
  Ingredient? _editing;

  bool get isEdit => ingredientId != null;

  Future<void> load() async {
    final id = ingredientId;
    if (id == null) {
      emit(
        const IngredientFormState(
          status: IngredientFormStatus.ready,
          values: {IngredientField.referenceGrams: '100'},
        ),
      );
      return;
    }
    try {
      final ingredient = await _ingredientRepository.watchIngredient(id).first;
      if (ingredient == null) {
        emit(state.copyWith(status: IngredientFormStatus.failure));
        return;
      }
      _editing = ingredient;
      emit(
        IngredientFormState(
          status: IngredientFormStatus.ready,
          values: {
            IngredientField.referenceGrams: IngredientField.format(
              ingredient.referenceGrams,
            ),
            IngredientField.name: ingredient.name,
            IngredientField.category: ingredient.category ?? '',
            ..._nutrientValues(ingredient.per100g),
          },
        ),
      );
    } on Exception {
      emit(state.copyWith(status: IngredientFormStatus.failure));
    }
  }

  Future<void> lookUpBarcode(String barcode) async {
    emit(
      state.copyWith(
        status: IngredientFormStatus.lookingUp,
        lookupOutcome: null,
      ),
    );
    final product = await _productLookupRepository.lookup(barcode);
    if (product == null) {
      emit(
        state.copyWith(
          status: IngredientFormStatus.ready,
          lookupOutcome: LookupOutcome.notFound,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        status: IngredientFormStatus.ready,
        lookupOutcome: LookupOutcome.found,
        scannedValues: {
          IngredientField.name: product.name,
          ..._nutrientValues(product.per100g),
        },
      ),
    );
  }

  Future<void> save(Map<IngredientField, String> input) async {
    final name = input[IngredientField.name] ?? '';
    if (name.trim().isEmpty) {
      emit(state.copyWith(status: IngredientFormStatus.invalid));
      return;
    }
    final category = input[IngredientField.category] ?? '';
    double number(IngredientField field) =>
        IngredientField.parse(input[field] ?? '');
    final per100g = Nutrients(
      kcal: number(IngredientField.kcal),
      proteinG: number(IngredientField.proteinG),
      carbsG: number(IngredientField.carbsG),
      sugarsG: number(IngredientField.sugarsG),
      fatG: number(IngredientField.fatG),
      saturatedG: number(IngredientField.saturatedG),
      fiberG: number(IngredientField.fiberG),
      saltMg: number(IngredientField.saltG) * _milligramsPerGram,
    );

    emit(state.copyWith(status: IngredientFormStatus.saving));
    try {
      final editing = _editing;
      if (editing == null) {
        await _ingredientRepository.addIngredient(
          name: name,
          category: category.trim().isEmpty ? null : category,
          referenceGrams: number(IngredientField.referenceGrams),
          per100g: per100g,
        );
      } else {
        await _ingredientRepository.updateIngredient(
          editing.copyWith(
            name: name,
            category: category.trim().isEmpty ? null : category,
            referenceGrams: number(IngredientField.referenceGrams),
            per100g: per100g,
          ),
        );
      }
      emit(state.copyWith(status: IngredientFormStatus.saved));
    } on Exception {
      emit(state.copyWith(status: IngredientFormStatus.failure));
    }
  }

  static Map<IngredientField, String> _nutrientValues(Nutrients per100g) => {
    IngredientField.kcal: IngredientField.format(per100g.kcal),
    IngredientField.fatG: IngredientField.format(per100g.fatG),
    IngredientField.saturatedG: IngredientField.format(per100g.saturatedG),
    IngredientField.carbsG: IngredientField.format(per100g.carbsG),
    IngredientField.sugarsG: IngredientField.format(per100g.sugarsG),
    IngredientField.fiberG: IngredientField.format(per100g.fiberG),
    IngredientField.proteinG: IngredientField.format(per100g.proteinG),
    IngredientField.saltG: IngredientField.format(
      per100g.saltMg / _milligramsPerGram,
    ),
  };
}
