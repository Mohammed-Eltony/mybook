import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';

showErrorDialog(context, String text, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.red,
      content: Text(text),
    ),
  );
}

showLodingDialog(context, String puthLottie) {
  showDialog(
    barrierDismissible: false,
    barrierColor: AppColors.black.withOpacity(0.7),
    context: context,
    builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Lottie.asset(
              width: ResponsiveLayout.getWidth(200, context),
              height: ResponsiveLayout.getHeight(200, context),
              puthLottie,
            ),
          ),
        ],
      );
    },
  );
}

Widget showLodingDialogs(BuildContext context, String assetPath) {
  return Scaffold(
    backgroundColor: AppColors.black.withOpacity(0.1),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // يمكنك إضافة رسوم متحركة أو صورة هنا باستخدام assetPath

          Lottie.asset(
            width: ResponsiveLayout.getWidth(200, context),
            height: ResponsiveLayout.getHeight(200, context),
            assetPath,
          ),
        ],
      ),
    ),
  );
}
