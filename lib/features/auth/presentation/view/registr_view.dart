import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/core/functions/custom_SnackBar.dart';
import 'package:mybook/core/functions/navigator.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/core/widgets/custom_btn.dart';
import 'package:mybook/core/widgets/custom_text_field.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/auth/presentation/manager/auth_state.dart';
import 'package:mybook/features/auth/presentation/view/login_view.dart';
import 'package:mybook/features/auth/presentation/widget/custom_header.dart';

class RegistrView extends StatefulWidget {
  const RegistrView({super.key});

  @override
  _RegistrViewState createState() => _RegistrViewState();
}

class _RegistrViewState extends State<RegistrView> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          navPop(context);
          showLodingDialog(context, 'assets/Successfully.json');

          Future.delayed(const Duration(seconds: 2), () {
            navPop(context); // لإغلاق الـ dialog
            navToRemoveUntil(
                context, const LoginView()); // التنقل إلى الشاشة التالية
          });
          // navPop(context);
        } else if (state is RegisterError) {
          navPop(context);

          showErrorDialog(context, state.error);
        } else if (state is RegisterLoading) {
          showLodingDialog(context, 'assets/loding_book.json');
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomHeader(
                title: 'Create Account',
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.8,
                child: Padding(
                  padding: ResponsiveLayout.getPadding(30, context),
                  child: Center(
                    child: Form(
                      key: globalKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextField(
                              controller: cubit.nameController,
                              hintText: 'name',
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter name';
                                }
                                return null;
                              }),
                          CustomTextField(
                              controller: cubit.emailControlRegister,
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email';
                                } else if (EmailValidator.validate(value) ==
                                    false) {
                                  return 'Please enter valid email';
                                }
                                return null;
                              }),
                          CustomTextField(
                              obscureText: obscureText,
                              suffix: IconButton(
                                  style: IconButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  icon: obscureText
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off)),
                              controller: cubit.passwordControlRegister,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: 'Password',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              }),
                          CustomBtn(
                            text: 'Register',
                            onPressed: () {
                              if (globalKey.currentState!.validate()) {
                                cubit.register();
                                // log("register");
                              }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                style:
                                    getSmallStyle(fontWeight: FontWeight.w500),
                                "Already have an account? ",
                              ),
                              InkWell(
                                onTap: () {
                                  navPop(context);
                                },
                                child: Text(
                                  style: getSmallStyle(),
                                  "LOGIN",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
