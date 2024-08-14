import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mybook/core/utils/colors.dart';

TextStyle getTitleStyle(context,
    {double? fontSize, FontWeight? fontWeight, Color? color}) {
  return TextStyle(
      fontSize: fontSize ?? 19,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? Theme.of(context).colorScheme.onSurface);
}

TextStyle getBodyStyle(context,
    {double? fontSize, FontWeight? fontWeight, Color? color}) {
  return TextStyle(
      fontSize: fontSize ?? 17,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? Theme.of(context).colorScheme.onSurface);
}

TextStyle getSmallStyle(
    {double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration}) {
  return TextStyle(
      fontSize: fontSize ?? 15,
      decoration: decoration ?? TextDecoration.none,
      decorationThickness: 1.5,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? AppColors.black);
}
