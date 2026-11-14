import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/supplement_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_field.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_form_state.dart';

class SupplementFormCubit extends Cubit<SupplementFormState> {
  new(this._repository, {this.supplementId})
    : super(const SupplementFormState());

  final SupplementRepository _repository;
  final int? supplementId;
  Supplement? _editing;

  bool get isEdit => supplementId != null;

  Future<void> load() async {
    final id = supplementId;
    if (id == null) {
      emit(const SupplementFormState(status: SupplementFormStatus.ready));
      return;
    }
    try {
      final supplement = await _repository.watchSupplement(id).first;
      if (supplement == null) {
        emit(state.copyWith(status: SupplementFormStatus.failure));
        return;
      }
      _editing = supplement;
      emit(
        SupplementFormState(
          status: SupplementFormStatus.ready,
          name: supplement.name,
          unit: supplement.unit,
          microValues: IngredientFormCubit.microValues(
            supplement.microsPerUnit,
          ),
        ),
      );
    } on Exception {
      emit(state.copyWith(status: SupplementFormStatus.failure));
    }
  }

  void selectUnit(SupplementUnit unit) => emit(state.copyWith(unit: unit));

  /// Saves the supplement; an empty or unparseable amount is unknown.
  Future<void> save({
    required String name,
    required Map<Micronutrient, String> micros,
  }) async {
    if (name.trim().isEmpty) {
      emit(state.copyWith(status: SupplementFormStatus.invalid));
      return;
    }
    final microsPerUnit = Micronutrients(
      amounts: {
        for (final MapEntry(key: nutrient, value: text) in micros.entries)
          nutrient: ?IngredientField.parseOptional(text),
      },
    );
    emit(state.copyWith(status: SupplementFormStatus.saving));
    try {
      final editing = _editing;
      if (editing == null) {
        await _repository.addSupplement(
          name: name.trim(),
          unit: state.unit,
          microsPerUnit: microsPerUnit,
        );
      } else {
        await _repository.updateSupplement(
          editing.copyWith(
            name: name.trim(),
            unit: state.unit,
            microsPerUnit: microsPerUnit,
          ),
        );
      }
      emit(state.copyWith(status: SupplementFormStatus.saved));
    } on Exception {
      emit(state.copyWith(status: SupplementFormStatus.failure));
    }
  }
}
