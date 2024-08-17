import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/functions/navigator.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/services/local_storage.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/auth/presentation/view/login_view.dart';
import 'package:mybook/features/profile/presentation/manager/user_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserModel? user = AuthCubit.get(context).userModel;
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Gap(
                ResponsiveLayout.getGap(20, context),
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.primary,
                backgroundImage: NetworkImage(user?.image ?? ''),
              ),
              Gap(
                ResponsiveLayout.getGap(10, context),
              ),
              Text("${user?.name}",
                  style: getTitleStyle(context, color: AppColors.white)),
              Gap(
                ResponsiveLayout.getGap(30, context),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.only(
                    topRight: ResponsiveLayout.getRadius(20, context),
                    bottomRight: ResponsiveLayout.getRadius(20, context),
                  ),
                ),
                child: ListTile(
                  onTap: () {},
                  trailing: const Icon(Icons.arrow_forward_ios),
                  leading: const Icon(Icons.history_edu),
                  title: const Text('Order History'),
                ),
              ),
              Gap(
                ResponsiveLayout.getGap(20, context),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.only(
                    topRight: ResponsiveLayout.getRadius(20, context),
                    bottomRight: ResponsiveLayout.getRadius(20, context),
                  ),
                ),
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.lock),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: const Text('Change Password'),
                ),
              ),
              Gap(
                ResponsiveLayout.getGap(20, context),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.only(
                    topRight: ResponsiveLayout.getRadius(20, context),
                    bottomRight: ResponsiveLayout.getRadius(20, context),
                  ),
                ),
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.delete),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: const Text('Delete Account'),
                ),
              ),
              Gap(
                ResponsiveLayout.getGap(20, context),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.only(
                    topRight: ResponsiveLayout.getRadius(20, context),
                    bottomRight: ResponsiveLayout.getRadius(20, context),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    AppLocalStorage.cacheData('token', '');
                    navToRemoveUntil(context, const LoginView());
                  },
                  leading: const Icon(Icons.logout),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: const Text('Log Out'),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
