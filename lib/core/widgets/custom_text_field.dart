import 'package:flutter/material.dart';
import 'package:mybook/core/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.keyboardType,
      this.label,
      this.suffix});

  String? hintText;
  TextInputType? keyboardType;

  TextEditingController? controller;
  Function(String?)? validator;
  bool obscureText;
  Widget? suffix;
  String? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      validator: (value) => validator != null ? validator!(value) : null,
      decoration: InputDecoration(
        label: label == null
            ? null
            : Text(
                label!,
                style: const TextStyle(color: AppColors.primary),
              ),
        suffixIcon: suffix,
        hintText: hintText ?? "",
      ),
    );
  }
}
