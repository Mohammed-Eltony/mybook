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
import 'package:mybook/core/widgets/nav_bar_widget.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/auth/presentation/manager/auth_state.dart';
import 'package:mybook/features/auth/presentation/view/forget_password_view.dart';
import 'package:mybook/features/auth/presentation/view/registr_view.dart';
import 'package:mybook/features/auth/presentation/widget/header_login.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool obscureText = false;

  @override
  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginSuccess) {
          navPop(context);
          // navTo(context, showLodingDialog(context, 'assets/Successfully.json'));

          navToRemoveUntil(context, const NavBarWidget());
        } else if (state is LoginError) {
          navPop(context);
          showErrorDialog(context, state.error);
        } else if (state is LoginLoading) {
          log('login loading');
          showLodingDialog(context, 'assets/loding_book.json');
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderLogin(),
              Padding(
                padding: ResponsiveLayout.getPadding(30, context),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  child: Form(
                    key: globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: cubit.emailControlLogin,
                            hintText: 'Email',
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
                            controller: cubit.passwordControlLogin,
                            keyboardType: TextInputType.visiblePassword,
                            hintText: 'Password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                navTo(context, const ForgetPasswordView());
                              },
                              child: Text(
                                style:
                                    getSmallStyle(fontWeight: FontWeight.w500),
                                "Forget Password ?",
                              ),
                            ),
                          ],
                        ),
                        CustomBtn(
                            text: 'LOGIN',
                            onPressed: () {
                              if (globalKey.currentState!.validate()) {
                                cubit.login();
                              }
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              style: getSmallStyle(fontWeight: FontWeight.w500),
                              "Don’t have an account? ",
                            ),
                            InkWell(
                              onTap: () {
                                navTo(context, const RegistrView());
                              },
                              child: Text(
                                style: getSmallStyle(),
                                "Register",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
