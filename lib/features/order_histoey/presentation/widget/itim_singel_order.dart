import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';

class ItimSingelOrder extends StatelessWidget {
  const ItimSingelOrder({
    super.key,
    required this.text,
    required this.icon,
    required this.title,
  });

  final String title;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
                getBodyStyle(context, fontSize: 13, color: AppColors.primary)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary),
            const Gap(10),
            Text(
              text,
              style: getBodyStyle(context,
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const Gap(25),
      ],
    );
  }
}
