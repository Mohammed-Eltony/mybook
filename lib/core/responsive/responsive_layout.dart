import 'package:flutter/material.dart';

class ResponsiveLayout {
  static double getWidth(double width, BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return width * (screenWidth / 375.0);
  }

  static double getHeight(double height, BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return height * (screenHeight / 812.0);
  }

  static double getFontSize(double fontSize, BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return fontSize * (screenWidth / 375.0);
  }

  static int getGridCrossAxisCount(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return 4;
    } else if (screenWidth > 800) {
      return 3;
    } else if (screenWidth > 600) {
      return 2;
    } else {
      return 1;
    }
  }

  static double getCardAspectRatio(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return 1.5;
    } else if (screenWidth > 800) {
      return 1.3;
    } else if (screenWidth > 600) {
      return 1.2;
    } else {
      return 1.0;
    }
  }

  static Radius getRadius(double radius, BuildContext context) {
    final double adjustedRadius = getWidth(radius, context);
    return Radius.circular(adjustedRadius);
  }

  static BorderRadius getBorderRadius(double radius, BuildContext context) {
    final double adjustedRadius = getWidth(radius, context);
    return BorderRadius.circular(adjustedRadius);
  }

  static double getIconSize(double size, BuildContext context) {
    return getWidth(size, context);
  }

  static EdgeInsets getPadding(double allSides, BuildContext context) {
    final double padding = getWidth(allSides, context);
    return EdgeInsets.all(padding);
  }

  static EdgeInsets getPaddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
    required BuildContext context,
  }) {
    final double leftPadding = getWidth(left, context);
    final double topPadding = getHeight(top, context);
    final double rightPadding = getWidth(right, context);
    final double bottomPadding = getHeight(bottom, context);
    return EdgeInsets.only(
      left: leftPadding,
      top: topPadding,
      right: rightPadding,
      bottom: bottomPadding,
    );
  }

  static EdgeInsets getHorizontalPadding(
      double horizontal, BuildContext context) {
    final double padding = getWidth(horizontal, context);
    return EdgeInsets.symmetric(horizontal: padding);
  }

  static EdgeInsets getVerticalPadding(double vertical, BuildContext context) {
    final double padding = getHeight(vertical, context);
    return EdgeInsets.symmetric(vertical: padding);
  }

  static EdgeInsets getMargin(double allSides, BuildContext context) {
    final double margin = getWidth(allSides, context);
    return EdgeInsets.all(margin);
  }

  static EdgeInsets getHorizontalMargin(
      double horizontal, BuildContext context) {
    final double margin = getWidth(horizontal, context);
    return EdgeInsets.symmetric(horizontal: margin);
  }

  static EdgeInsets getVerticalMargin(double vertical, BuildContext context) {
    final double margin = getHeight(vertical, context);
    return EdgeInsets.symmetric(vertical: margin);
  }

  static double getGap(double gap, BuildContext context) {
    return getWidth(gap, context);
  }
}
