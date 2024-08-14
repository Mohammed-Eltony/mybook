import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.keyboardType,
      this.suffix});

  String? hintText;
  TextInputType? keyboardType;

  TextEditingController? controller;
  Function(String?)? validator;
  bool obscureText;
  Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      validator: (value) => validator != null ? validator!(value) : null,
      decoration: InputDecoration(
        suffixIcon: suffix,
        hintText: hintText ?? "",
      ),
    );
  }
}
