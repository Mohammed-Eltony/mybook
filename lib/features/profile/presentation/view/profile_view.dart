import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/functions/open_camara.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/core/widgets/custom_text_field.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/auth/presentation/manager/auth_state.dart';
import 'package:mybook/features/profile/presentation/manager/user_model.dart';
import 'package:mybook/features/profile/presentation/widgets/CustomListTile.dart';
import 'package:shimmer/shimmer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    AuthCubit.get(context).addEdit();
  }

  @override
  Widget build(BuildContext context) {
    UserModel? user = AuthCubit.get(context).userModel;
    var cubit = AuthCubit.get(context);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is EditProfileSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {}); // Refresh the profile view
          });
        }

        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  cubit.addEdit();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: const Text("Edit Profile"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          right: ResponsiveLayout.getWidth(
                                              5, context),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        width: ResponsiveLayout.getWidth(
                                            100, context),
                                        height: ResponsiveLayout.getHeight(
                                            100, context),
                                        child: cubit.puthImgegEdit == null
                                            ? Image.network(
                                                user?.image ?? '',
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return SizedBox(
                                                    width: 50,
                                                    height: ResponsiveLayout
                                                        .getHeight(
                                                            150, context),
                                                    child: Shimmer.fromColors(
                                                      baseColor: AppColors.grey,
                                                      highlightColor:
                                                          AppColors.white,
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                              ResponsiveLayout
                                                                  .getHeight(20,
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                            : Image.file(
                                                cubit.puthImgegEdit!,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: SizedBox(
                                          width: ResponsiveLayout.getWidth(
                                              35, context),
                                          height: ResponsiveLayout.getHeight(
                                              35, context),
                                          child: FloatingActionButton(
                                            onPressed: () async {
                                              var puthImag =
                                                  await OpenCameraAndGallery
                                                      .uploadImages(
                                                isCameraOrgallery: false,
                                              );

                                              if (puthImag != null) {
                                                setState(() {
                                                  cubit.puthImgegEdit =
                                                      File(puthImag);
                                                });
                                              }
                                            },
                                            child: const Icon(
                                              Icons.camera_alt,
                                              color: AppColors.green,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Gap(ResponsiveLayout.getGap(20, context)),
                                  CustomTextField(
                                    controller: cubit.nameEditControl,
                                    hintText: "Name",
                                    label: 'name',
                                  ),
                                  Gap(ResponsiveLayout.getGap(20, context)),
                                  CustomTextField(
                                    controller: cubit.phoneEditControl,
                                    hintText: "Phone",
                                    label: 'phone',
                                  ),
                                  Gap(ResponsiveLayout.getGap(20, context)),
                                  CustomTextField(
                                    controller: cubit.cityEditControl,
                                    hintText: "City",
                                    label: 'city',
                                  ),
                                  Gap(ResponsiveLayout.getGap(20, context)),
                                  CustomTextField(
                                    controller: cubit.addressEditControl,
                                    hintText: "Address",
                                    label: 'address',
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    cubit.puthImgegEdit = null;
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await cubit.editProfile();
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Edit"),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  color: AppColors.green,
                  size: 28,
                ),
              )
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
                      backgroundImage:
                          NetworkImage(user?.image.toString() ?? ''),
                    ),
                    Gap(ResponsiveLayout.getGap(10, context)),
                    Text(
                      user?.name.toString() ?? '',
                      style: getTitleStyle(context),
                    ),
                    Gap(ResponsiveLayout.getGap(20, context)),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius:
                            ResponsiveLayout.getBorderRadius(20, context),
                      ),
                      child: Column(
                        children: [
                          CustomListTile(
                            title: "Email",
                            icon: Icons.email,
                            subtitle: user?.email ?? 'email unspecified',
                          ),
                          const Divider(color: AppColors.primary),
                          CustomListTile(
                            title: "Phone",
                            icon: Icons.phone,
                            subtitle: user?.phone ?? 'phone unspecified',
                          ),
                          const Divider(color: AppColors.primary),
                          CustomListTile(
                            title: "City",
                            icon: Icons.location_city,
                            subtitle: user?.city ?? 'city unspecified',
                          ),
                          const Divider(color: AppColors.primary),
                          CustomListTile(
                            title: "Address",
                            icon: Icons.location_on,
                            subtitle: user?.address ?? 'address unspecified',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
