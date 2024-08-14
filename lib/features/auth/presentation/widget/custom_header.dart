import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/functions/navigator.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';

class CustomHeader extends StatelessWidget {
  CustomHeader({
    super.key,
    this.title,
  });

  String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: ResponsiveLayout.getRadius(30, context),
          bottomRight: ResponsiveLayout.getRadius(30, context),
        ),
        color: AppColors.fillColor,
      ),
      child: Padding(
        padding: ResponsiveLayout.getPaddingOnly(
            left: 20, top: 20, context: context),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                navPop(context);
              },
              child: Container(
                padding: ResponsiveLayout.getPadding(5, context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      ResponsiveLayout.getRadius(50, context),
                    ),
                    color: AppColors.primary),
                child: Icon(
                  Icons.arrow_back,
                  size: ResponsiveLayout.getIconSize(24, context),
                ),
              ),
            ),
            Gap(ResponsiveLayout.getGap(10, context)),
            Text(
              title ?? 'Title',
              style: getTitleStyle(context, color: AppColors.white),
            )
          ],
        ),
      ),
    );
  }
}
