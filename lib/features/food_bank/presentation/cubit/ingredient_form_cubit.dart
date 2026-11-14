import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/product_lookup_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_field.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_state.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';

class IngredientFormCubit extends Cubit<IngredientFormState> {
  new(
    this._ingredientRepository,
    this._productLookupRepository,
    this._settingsRepository, {
    this.ingredientId,
  }) : super(const IngredientFormState());

  static const _milligramsPerGram = 1000;

  final IngredientRepository _ingredientRepository;
  final ProductLookupRepository _productLookupRepository;
  final SettingsRepository _settingsRepository;
  final int? ingredientId;
  Ingredient? _editing;

  bool get isEdit => ingredientId != null;

  Future<void> load() async {
    final id = ingredientId;
    try {
      final showMicros = await _settingsRepository.watchMicrocalEnabled().first;
      if (id == null) {
        emit(
          IngredientFormState(
            status: IngredientFormStatus.ready,
            values: const {IngredientField.referenceGrams: '100'},
            showMicros: showMicros,
          ),
        );
        return;
      }
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
            ...nutrientValues(ingredient.per100g),
          },
          microValues: microValues(ingredient.per100g.micros),
          showMicros: showMicros,
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
          ...nutrientValues(product.per100g),
        },
        scannedMicroValues: microValues(product.per100g.micros),
      ),
    );
  }

  /// Saves the fields; an empty or unparseable micronutrient is unknown.
  Future<void> save(
    Map<IngredientField, String> input, {
    Map<Micronutrient, String> micros = const {},
  }) async {
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
      micros: Micronutrients(
        amounts: {
          for (final MapEntry(key: nutrient, value: text) in micros.entries)
            nutrient: ?IngredientField.parseOptional(text),
        },
      ),
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

  /// The form texts of [per100g]'s calories and macros, salt in grams.
  static Map<IngredientField, String> nutrientValues(Nutrients per100g) => {
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

  /// The form texts of the known micronutrients.
  static Map<Micronutrient, String> microValues(Micronutrients micros) => {
    for (final MapEntry(key: nutrient, value: amount) in micros.amounts.entries)
      nutrient: IngredientField.format(amount),
  };
}
