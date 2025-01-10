import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    super.key,
    required this.onChanged,
    this.value,
  });
  final Function(bool?)? onChanged;
  final bool? value;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Checkbox(
            side: const BorderSide(width: 1.5, color: Colors.grey),
            visualDensity: const VisualDensity(
              horizontal: -4.0,
            ),
            checkColor: Colors.white,
            activeColor: AppColors.kSecondColor,
            value: value,
            onChanged: onChanged);
      },
    );
  }
}
