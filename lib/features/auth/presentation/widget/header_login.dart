import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage('assets/bacgroind.jpg'), fit: BoxFit.fill),
        borderRadius: BorderRadius.only(
          bottomLeft: ResponsiveLayout.getRadius(30, context),
          bottomRight: ResponsiveLayout.getRadius(30, context),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: ResponsiveLayout.getRadius(30, context),
                  bottomRight: ResponsiveLayout.getRadius(30, context),
                ),
                color: AppColors.black.withOpacity(
                  0.5,
                ),
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: SvgPicture.asset('assets/logo2.svg')),
          Positioned(
            bottom: ResponsiveLayout.getHeight(30, context),
            right: 0,
            left: 0,
            child: Text(
              textAlign: TextAlign.center,
              'Welcome Back!',
              style: getTitleStyle(context,
                  color: AppColors.white,
                  fontSize: ResponsiveLayout.getFontSize(18, context)),
            ),
          )
        ],
      ),
    );
  }
}
