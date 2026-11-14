import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/supplement_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_details_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/supplement_details_view.dart';

class SupplementDetailsPage extends StatelessWidget {
  const new({required this.supplementId, super.key});

  final int supplementId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupplementDetailsCubit(
        context.read<SupplementRepository>(),
        supplementId,
      )..watch(),
      child: const SupplementDetailsView(),
    );
  }
}
