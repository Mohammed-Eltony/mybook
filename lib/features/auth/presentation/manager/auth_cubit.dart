import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/core/services/dio_helper.dart';
import 'package:mybook/core/services/end_points.dart';
import 'package:mybook/core/services/local_storage.dart';
import 'package:mybook/features/auth/presentation/manager/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

// login
  TextEditingController emailControlLogin = TextEditingController();
  TextEditingController passwordControlLogin = TextEditingController();
  login() {
    emit(LoginLoading());
    DioHelper.postData(url: EndPoints.login, data: {
      'email': emailControlLogin.text,
      'password': passwordControlLogin.text,
    }).then((value) {
      AppLocalStorage.cacheData('token', value.data['data']['token']);

      emit(LoginSuccess());
    }).catchError((error) {
      log(error.response.data["message"].toString());
      if (error.response != null && error.response.statusCode == 422) {
        emit(LoginError(error.response.data['message'].toString()));
      } else {
        emit(LoginError(error.response.toString()));
      }
    });
  }

  // register

  TextEditingController nameController = TextEditingController();
  TextEditingController emailControlRegister = TextEditingController();
  TextEditingController passwordControlRegister = TextEditingController();

  register() {
    emit(RegisterLoading());
    DioHelper.postData(url: EndPoints.register, data: {
      'name': nameController.text,
      'email': emailControlRegister.text,
      'password': passwordControlRegister.text,
      'password_confirmation': passwordControlRegister.text,
    }).then(
      (value) {
        log(value.data['data']['token']);

        emit(RegisterSuccess());
      },
    ).catchError((error) {
      if (error.response != null && error.response.statusCode == 422) {
        emit(RegisterError(
            error.response.data['errors']['email'][0].toString()));
      } else {
        emit(RegisterError(error.response.toString()));
      }
    });
  }

  // forgot password

  TextEditingController emailControlForgot = TextEditingController();
  putEmailCode() {
    emit(ForgotPasswordLoading());

    DioHelper.postData(url: EndPoints.forgetPassword, data: {
      'email': emailControlForgot.text,
    }).then((value) {
      // log(value.data['data'].toString());
      emit(ForgotPasswordSuccess());
    }).catchError(
      (error) {
        log(error.response.data.toString());
        if (error.response != null && error.response.statusCode == 422) {
          emit(ForgotPasswordError(error.response.data['message'].toString()));
        } else {
          emit(ForgotPasswordError(error.response.toString()));
        }
      },
    );
  }

  // reset password

  TextEditingController codeControl = TextEditingController();
  TextEditingController passwordNewControl = TextEditingController();
  TextEditingController confirmPasswordControl = TextEditingController();

  resetPassowrd() {
    emit(ResetPasswordLoading());

    DioHelper.postData(url: EndPoints.resetPassowrd, data: {
      'verify_code': codeControl.text,
      'new_password': passwordNewControl.text,
      'new_password_confirmation': confirmPasswordControl.text,
    }).then((value) {
      log(value.data['data'].toString());
      emit(ResetPasswordSuccess());
    }).catchError(
      (error) {
        log(error.response.data.toString());
        if (error.response != null && error.response.statusCode == 422) {
          emit(ResetPasswordError(error.response.data['message'].toString()));
        } else {
          emit(ResetPasswordError(error.response.toString()));
        }
      },
    );
  }
}
