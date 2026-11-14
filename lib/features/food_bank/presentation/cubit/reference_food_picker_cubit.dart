import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/reference_food.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/reference_food_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/services/reference_food_search.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/reference_food_picker_state.dart';

class ReferenceFoodPickerCubit extends Cubit<ReferenceFoodPickerState> {
  new(this._repository) : super(const ReferenceFoodPickerState());

  final ReferenceFoodRepository _repository;
  List<ReferenceFood> _foods = const [];

  Future<void> load() async {
    try {
      _foods = await _repository.loadAll();
      emit(
        state.copyWith(
          status: ReferenceFoodPickerStatus.ready,
          results: ReferenceFoodSearch.search(_foods, state.query),
        ),
      );
    } on Exception {
      emit(state.copyWith(status: ReferenceFoodPickerStatus.failure));
    }
  }

  void search(String query) => emit(
    state.copyWith(
      query: query,
      results: ReferenceFoodSearch.search(_foods, query),
    ),
  );
}
