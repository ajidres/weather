import 'dart:io';


import 'package:banka/shared/designsystem/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFromWidget extends StatelessWidget {
  const TextFromWidget({
    super.key,
    this.controller,
    required this.textInputType,
    this.maxLength,
    required this.validationFunction,
    this.isHidden = false,
    this.hint = "",
    this.prefixIcon,
    this.suffixIcon,
    this.enable = true,
  });

  final TextEditingController? controller;
  final TextInputType textInputType;
  final String hint;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isHidden;
  final bool enable;
  final String? Function(String? val) validationFunction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      obscureText: isHidden,
      controller: controller,

      keyboardType: textInputType == TextInputType.number && Platform.isIOS
          ? TextInputType.numberWithOptions(signed: true)
          : textInputType,
      maxLength: maxLength,
      decoration: InputDecoration(
        isDense: true,
        border: AppTheme.instance.boxForm,
        focusedBorder: AppTheme.instance.boxForm.copyWith(borderSide: BorderSide(
          color: AppTheme.instance.bnkPrimary,
          width: 1.0,
        )),
        disabledBorder: AppTheme.instance.boxForm,
        enabledBorder: AppTheme.instance.boxForm,
        counterText: "",
        hintText: hint,
        prefixIcon: prefixIcon,
        errorMaxLines: 2,
        suffix: suffixIcon,
      ),
      validator: validationFunction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
