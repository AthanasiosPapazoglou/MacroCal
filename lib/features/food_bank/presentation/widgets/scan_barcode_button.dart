import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/core/widgets/loader.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_state.dart';

class ScanBarcodeButton extends StatelessWidget {
  const new({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngredientFormCubit, IngredientFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        final isLookingUp = state.status == IngredientFormStatus.lookingUp;
        return ElevatedButton(
          onPressed: isLookingUp ? null : onPressed,
          child: isLookingUp
              ? const Loader(size: 24)
              : const Icon(Icons.qr_code_scanner_rounded),
        );
      },
    );
  }
}
