import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      this.hint,
      this.icon,
      this.suffixIcon,
      this.onChanged,
      this.textInputType,
      this.onTapSuffixIcon,
      this.colorSuffixIcon,
      this.controller,
      this.initialValue,
      this.fontSizeForHintStyle = 16,
      this.onTap,
      this.suffix,
      this.maxLines,
      this.contentPadding,
      this.weHaveInputFormatters = false});
  final String? hint;
  final IconData? icon;
  final IconData? suffixIcon;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onTapSuffixIcon;
  final TextInputType? textInputType;
  final Color? colorSuffixIcon;
  final TextEditingController? controller;
  final String? initialValue;
  final double fontSizeForHintStyle;
  final Widget? suffix;
  final int? maxLines;
  final bool? weHaveInputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLines,
      onTap: onTap,
      initialValue: initialValue,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      onChanged: onChanged,
      obscureText: hint == S.of(context).Password
          ? BlocProvider.of<AuthCubit>(context).obscurePasswordTextValue
          : false,
      cursorColor: AppColors.kSecondColor,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.kSecondColor),
        ),
        hintText: hint,

        suffix: suffix,
        hintStyle: TextStyle(
          color: AppColors.kGrey,
          fontSize: fontSizeForHintStyle,
        ),

        // prefixIcon: Icon(
        //   icon,
        //   color: AppColors.kGrey,
        // ),
        suffixIcon: GestureDetector(
          onTap: onTapSuffixIcon,
          child: Icon(
            suffixIcon,
            color: colorSuffixIcon,
            size: 20,
          ),
        ),
      ),
      inputFormatters: weHaveInputFormatters == true
          ? [
              TextInputFormatter.withFunction(
                (oldValue, newValue) {
                  // فلترة النص للسماح فقط بالأحرف الإنجليزية
                  final filteredText =
                      newValue.text.replaceAll(RegExp(r'[^a-zA-Z]'), '');
                  return TextEditingValue(
                    text:
                        filteredText.toUpperCase(), // تحويل النص إلى أحرف كبيرة
                    selection: newValue.selection,
                  );
                },
              ),
            ]
          : [],
    );
  }
}
