import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/functions/custom_SnackBar.dart';
import 'package:mybook/core/functions/navigator.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/widgets/custom_btn.dart';
import 'package:mybook/core/widgets/custom_text_field.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/auth/presentation/manager/auth_state.dart';
import 'package:mybook/features/auth/presentation/view/login_view.dart';
import 'package:mybook/features/auth/presentation/widget/custom_header.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  bool obscure1 = true;
  bool obscure2 = true;
  final globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ResetPasswordSuccess) {
          navPop(context);
          showErrorDialog(context, 'Success', color: Colors.green);
          Future.delayed(const Duration(seconds: 2), () {
            navPop(context); // لإغلاق الـ dialog
            navToRemoveUntil(
                context, const LoginView()); // التنقل إلى الشاشة التالية
          });
        } else if (state is ResetPasswordError) {
          navPop(context);
          showErrorDialog(context, state.error);
        } else if (state is ResetPasswordLoading) {
          showLodingDialog(context, 'assets/loding_book.json');
        }
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CustomHeader(
              title: "Reset Password",
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
                      hintText: "code",
                      controller: cubit.codeControl,
                      keyboardType: TextInputType.number,
                    ),
                    Gap(ResponsiveLayout.getGap(20, context)),
                    CustomTextField(
                        obscureText: obscure1,
                        suffix: IconButton(
                            style: IconButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                            ),
                            onPressed: () {
                              setState(() {
                                obscure1 = !obscure1;
                              });
                            },
                            icon: obscure1
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        keyboardType: TextInputType.visiblePassword,
                        hintText: 'new Password',
                        controller: cubit.passwordNewControl,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        }),
                    Gap(ResponsiveLayout.getGap(20, context)),
                    CustomTextField(
                        obscureText: obscure2,
                        suffix: IconButton(
                            style: IconButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                            ),
                            onPressed: () {
                              setState(() {
                                obscure2 = !obscure2;
                              });
                            },
                            icon: obscure2
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        controller: cubit.confirmPasswordControl,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: 'confirm Password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        }),
                    Gap(ResponsiveLayout.getGap(20, context)),
                    CustomBtn(
                        text: "Reset Password",
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            cubit.resetPassowrd();
                          }
                        }),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
