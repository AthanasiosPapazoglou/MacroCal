import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/supplement_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_details_state.dart';

class SupplementDetailsCubit extends Cubit<SupplementDetailsState> {
  new(this._repository, this.supplementId)
    : super(const SupplementDetailsState());

  final SupplementRepository _repository;
  final int supplementId;
  StreamSubscription<Supplement?>? _supplement;

  void watch() {
    _supplement ??= _repository.watchSupplement(supplementId).listen(
      (supplement) {
        if (state.status == SupplementDetailsStatus.deleted) return;
        emit(
          SupplementDetailsState(
            status: supplement == null
                ? SupplementDetailsStatus.notFound
                : SupplementDetailsStatus.ready,
            supplement: supplement,
          ),
        );
      },
      onError: (Object _) =>
          emit(state.copyWith(status: SupplementDetailsStatus.failure)),
    );
  }

  Future<void> delete() async {
    try {
      await _repository.deleteSupplement(supplementId);
      emit(state.copyWith(status: SupplementDetailsStatus.deleted));
    } on Exception {
      emit(state.copyWith(status: SupplementDetailsStatus.failure));
    }
  }

  @override
  Future<void> close() async {
    await _supplement?.cancel();
    await super.close();
  }
}
