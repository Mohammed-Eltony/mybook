import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:rive/rive.dart';

// showLoading({required context}) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return const Center(
//         child: SizedBox(
//           height: 250,
//           width: 250,
//           child: RiveAnimation.asset(
//             'assets/riv/loading_book.riv',
//             fit: BoxFit.cover,
//           ),
//         ),
//       );
//     },
//   );
// }

showError({required context, required textError}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.red,
      content: Text(textError)));
}

showSnackBar({required context, required textError}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: AppColors.primary,
      content: Text(textError)));
}

showLottieDialog({required context, required String lottieAsset}) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: Lottie.asset(lottieAsset),
        ),
      );
    },
  );
}

showRiveDialog({required context, required String path}) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: RiveAnimation.asset(
            path,
            fit: BoxFit.cover,
          ),
        ),
      );
    },
  );
}
