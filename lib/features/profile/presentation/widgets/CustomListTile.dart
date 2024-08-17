import 'package:flutter/material.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  IconData icon;
  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(
        title,
        style: getTitleStyle(context, color: AppColors.white),
      ),
      subtitle: Text(
        subtitle,
        style: getSmallStyle(color: AppColors.white),
      ),
    );
  }
}
