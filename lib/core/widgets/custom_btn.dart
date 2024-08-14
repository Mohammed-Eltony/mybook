import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';

class CustomBtn extends StatelessWidget {
  CustomBtn(
      {super.key,
      this.width,
      required this.text,
      this.onPressed,
      this.backgroundColor,
      this.height,
      this.textColor});
  double? width;
  double? height;
  String text;
  Function()? onPressed;
  Color? backgroundColor;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? ResponsiveLayout.getHeight(height ?? 50, context),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )),
          onPressed: onPressed ?? () {},
          child: Text(
            text,
            style: getBodyStyle(context, color: textColor ?? AppColors.white),
          )),
    );
  }
}
