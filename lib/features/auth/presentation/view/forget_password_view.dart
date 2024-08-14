import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:mybook/core/functions/custom_SnackBar.dart';
import 'package:mybook/core/functions/navigator.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/widgets/custom_btn.dart';
import 'package:mybook/core/widgets/custom_text_field.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/auth/presentation/manager/auth_state.dart';
import 'package:mybook/features/auth/presentation/view/reset_password_view.dart';
import 'package:mybook/features/auth/presentation/widget/custom_header.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ForgotPasswordSuccess) {
          navPop(context);
          showErrorDialog(context, 'Check your email', color: Colors.green);
          navTo(context, const ResetPasswordView());
        } else if (state is ForgotPasswordError) {
          navPop(context);
          showErrorDialog(context, state.error);
        } else if (state is ForgotPasswordLoading) {
          showLodingDialog(context, 'assets/loding_book.json');
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            CustomHeader(
              title: "Forget Password",
            ),
            Expanded(
                child: Padding(
              padding: ResponsiveLayout.getPadding(30, context),
              child: Form(
                key: globalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      controller: cubit.emailControlForgot,
                      hintText: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        } else if (EmailValidator.validate(value) == false) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                    ),
                    const Gap(20),
                    CustomBtn(
                        text: 'Forget Password',
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            cubit.putEmailCode();
                            // navTo(context, const ResetPasswordView());
                          }
                        }),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
