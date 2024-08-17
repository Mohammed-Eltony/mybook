import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/core/widgets/custom_text_field.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/profile/presentation/manager/user_model.dart';
import 'package:mybook/features/profile/presentation/widgets/CustomListTile.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel? user = AuthCubit.get(context).userModel;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: AlertDialog(
                        title: const Text("Edit Profile"),
                        content: Column(
                          children: [
                            Stack(children: [
                              const CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                    'assets/user avatar.png',
                                  )),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: SizedBox(
                                  width: ResponsiveLayout.getWidth(35, context),
                                  height:
                                      ResponsiveLayout.getHeight(35, context),
                                  child: FloatingActionButton(
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: AppColors.green,
                                      )),
                                ),
                              )
                            ]),
                            Gap(ResponsiveLayout.getGap(20, context)),
                            CustomTextField(
                              hintText: "Name",
                            ),
                            Gap(ResponsiveLayout.getGap(20, context)),
                            CustomTextField(
                              hintText: "phone",
                            ),
                            Gap(ResponsiveLayout.getGap(20, context)),
                            CustomTextField(
                              hintText: "City",
                            ),
                            Gap(ResponsiveLayout.getGap(20, context)),
                            CustomTextField(
                              hintText: "Address",
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          TextButton(
                              onPressed: () {}, child: const Text("Edit")),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.edit,
                color: AppColors.green,
                size: 28,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveLayout.getPadding(15, context),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(user?.image.toString() ?? ''),
                ),
                Gap(
                  ResponsiveLayout.getGap(10, context),
                ),
                Text(
                  user?.name.toString() ?? '',
                  style: getTitleStyle(context),
                ),
                Gap(
                  ResponsiveLayout.getGap(20, context),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius:
                            ResponsiveLayout.getBorderRadius(20, context)),
                    child: Column(
                      children: [
                        CustomListTile(
                          title: "Email",
                          icon: Icons.email,
                          subtitle: user?.email.toString() ?? '',
                        ),
                        const Divider(
                          color: AppColors.primary,
                        ),
                        CustomListTile(
                          title: "Phone",
                          icon: Icons.phone,
                          subtitle: user?.phone.toString() ?? '',
                        ),
                        const Divider(
                          color: AppColors.primary,
                        ),
                        CustomListTile(
                          title: "City",
                          icon: Icons.location_city,
                          subtitle: user?.city.toString() ?? '',
                        ),
                        const Divider(
                          color: AppColors.primary,
                        ),
                        CustomListTile(
                          title: "Address",
                          icon: Icons.location_on,
                          subtitle: user?.address.toString() ?? '',
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
