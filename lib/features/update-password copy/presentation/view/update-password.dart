import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/core/functions/custom_SnackBar.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/core/widgets/custom_btn.dart';
import 'package:mybook/core/widgets/custom_text_field.dart';
import 'package:mybook/core/widgets/show_loading_and_error.dart';
import 'package:mybook/features/update-password%20copy/presentation/manager/update_password_cubit.dart';
import 'package:mybook/features/update-password%20copy/presentation/manager/update_password_state.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  bool obscureText = true;
  TextEditingController currentController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Change Password',
          style: getTitleStyle(
            context,
            color: AppColors.primary,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => UpdatePasswordCubit(),
        child: Form(
          key: key,
          child: BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
            listener: (context, state) async {
              if (state is UpdatePasswordSuccess) {
                await Future.delayed(const Duration(seconds: 3), () {
                  showLodingDialogs(context, 'assets/Successfully.json');
                });
                Navigator.pop(context);
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pop(context);
                });
              } else if (state is UpdatePasswordLoading) {
                showLodingDialogs(context, 'assets/loding_book.json');
              } else if (state is UpdatePasswordError) {
                showErrorDialog(context, "Error");
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(context);
                });
              }
            },
            builder: (context, state) {
              var cubit = UpdatePasswordCubit.get(context);

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        CustomTextField(
                          label: 'Current Password',
                          keyboardType: TextInputType.number,
                          controller: currentController,
                          hintText: 'Enter your current password',
                          obscureText: obscureText,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Code is Required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          obscureText: obscureText,
                          controller: passwordController,
                          label: 'New Password',
                          hintText: 'Enter the new password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is Required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          obscureText: obscureText,
                          controller: confirmPasswordController,
                          label: 'Confirm Password',
                          hintText: 'Enter your confirm password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is Required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomBtn(
                          text: 'Change Password',
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              cubit.updatePassword(
                                current_password: currentController.text,
                                new_password: passwordController.text,
                                new_password_confirmation:
                                    confirmPasswordController.text,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
