import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/core/functions/navigator.dart';
import 'package:mybook/core/services/dio_helper.dart';
import 'package:mybook/core/services/end_points.dart';
import 'package:mybook/core/services/local_storage.dart';
import 'package:mybook/features/auth/presentation/manager/auth_state.dart';
import 'package:mybook/features/auth/presentation/view/login_view.dart';
import 'package:mybook/features/favarite/presentation/manager/favarite_model/favarite_model.dart';
import 'package:mybook/features/home/presentation/manager/category_model/category_model.dart';
import 'package:mybook/features/home/presentation/manager/product/product_model.dart';
import 'package:mybook/features/profile/presentation/manager/user_model.dart';

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
      log("Login cached token:${AppLocalStorage.getCacheData('token')}");

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

  List sliders = [];
// get home headers slider
  getHomeHeadersSlider() {
    emit(HeadersLoading());
    DioHelper.getData(url: EndPoints.sliders).then((value) {
      sliders = value.data['data']['sliders'];

      emit(HeadersSuccess());
    }).catchError((error) {
      log(error.response.data.toString());
      if (error.response != null && error.response.statusCode == 422) {
        emit(HeadersError(error.response.data['message'].toString()));
      } else {
        emit(HeadersError(error.response.toString()));
      }
    });
  }

  Set<ProductModel> products = {};
  // get best sellrey
  getBestSellery() {
    emit(BastSellerLoading());
    DioHelper.getData(url: EndPoints.productsBestseller).then((value) {
      // log(value.data['data']['products'].toString());
      value.data['data']['products'].forEach((element) {
        products.add(ProductModel.fromJson(element));
      });

      emit(BastSellerSuccess());
    }).catchError((error) {
      log(error.response.data.toString());
      if (error.response != null && error.response.statusCode == 422) {
        emit(BastSellerError(error.response.data['message'].toString()));
      } else {
        emit(BastSellerError(error.response.toString()));
      }
    });
  }

  // get categories
  List<CategoryModel> categories = [];
  getCategories() {
    emit(CategoryLoading());
    DioHelper.getData(url: EndPoints.categories).then((value) {
      value.data['data']['categories'].forEach((element) {
        categories.add(CategoryModel.fromJson(element));
      });
      emit(CategorySuccess());
    }).catchError((error) {
      log(error.response.data.toString());
      if (error.response != null && error.response.statusCode == 422) {
        emit(CategoryError(error.response.data['message'].toString()));
      } else {
        emit(CategoryError(error.response.toString()));
      }
    });
  }

  //get Show Category

  Set<ProductModel> showCategories = {};
  getShowCategories({required String id}) {
    emit(ShowCategoryLoading());
    DioHelper.getData(url: '${EndPoints.showCategory}$id').then((value) {
      if (showCategories.isNotEmpty) {
        showCategories.clear();
      }

      value.data['data']['products'].forEach((element) {
        showCategories.add(ProductModel.fromJson(element));
      });

      emit(ShowCategorySuccess());
    }).catchError((error) {
      log(error.response.data.toString());
      if (error.response != null && error.response.statusCode == 422) {
        emit(ShowCategoryError(error.response.data['message'].toString()));
      } else {
        emit(ShowCategoryError(error.response.toString()));
      }
    });
  }

  // get profile

  UserModel? userModel;
  getProfile() {
    emit(ProfileLoading());
    String? token = AppLocalStorage.getCacheData('token');
    DioHelper.getData(
      url: EndPoints.profile,
      token: token,
    ).then((value) {
      log('profile Success Token : $token');
      UserModel user = UserModel.fromJson(value.data['data']);
      userModel = user;
      // log(userModel!.toJson().toString());
      emit(ProfileSuccess());
    }).catchError((error) {
      log('profile Error Token : $token');
      log(error.response.data.toString());
      if (error.response != null && error.response.statusCode == 422) {
        emit(ProfileError(error.response.data['message'].toString()));
      } else {
        emit(ProfileError(error.response.toString()));
      }
    });
  }

  // edit profile

  TextEditingController nameEditControl = TextEditingController();
  TextEditingController phoneEditControl = TextEditingController();
  TextEditingController cityEditControl = TextEditingController();
  TextEditingController addressEditControl = TextEditingController();
  File? puthImgegEdit;

  addEdit() {
    log('edit');
    var nameEdit =
        nameEditControl.text.isEmpty ? userModel?.name : nameEditControl.text;
    var phoneEdit = phoneEditControl.text.isNotEmpty
        ? phoneEditControl.text
        : userModel?.phone ?? '';
    var cityEdit = cityEditControl.text.isNotEmpty
        ? cityEditControl.text
        : userModel?.city ?? '';
    var addressEdit = addressEditControl.text.isNotEmpty
        ? addressEditControl.text
        : userModel?.address ?? '';

    log('name: $nameEdit');
    log('phone: $phoneEdit');
    log('city: $cityEdit');
    log('address: $addressEdit');
    nameEditControl = TextEditingController(text: nameEdit);
    phoneEditControl = TextEditingController(text: phoneEdit);
    cityEditControl = TextEditingController(text: cityEdit);
    addressEditControl = TextEditingController(text: addressEdit);

    return [nameEdit, addressEdit, cityEdit, phoneEdit];
  }

  Future<void> editProfile() async {
    emit(EditProfileLoading());

    // التأكد من تعبئة الحقول بالقيم الحالية من userModel

    String? token = AppLocalStorage.getCacheData('token');

    try {
      // إعداد FormData لتجميع البيانات والصورة
      FormData formData = FormData.fromMap({
        'name': '${addEdit()[0]}',
        if (puthImgegEdit != null)
          'image': await MultipartFile.fromFile(
            puthImgegEdit!.path,
            filename: puthImgegEdit!.path.split('/').last,
          ),
        'address': addEdit()[1],
        'city': addEdit()[2],
        'phone': addEdit()[3],
      });

      // تسجيل FormData قبل إرسالها
      log('FormData: ${formData.fields.toString()}');

      // إرسال البيانات باستخدام Dio
      await DioHelper.postData(
        url: EndPoints.update_profile,
        token: token,
        data: formData,
      ).then((value) {
        getProfile();
        log('Edit Response: ${value.data.toString()}');
        emit(EditProfileSuccess());
      }).catchError((error) {
        log('Error: ${error.toString()}');
      }).catchError((error) {
        if (error is DioException) {
          if (error.response != null) {
            log('Response status code: ${error.response?.statusCode}');
            log('Response data: ${error.response?.data}');
          } else {
            log('Error: ${error.message}');
          }
        } else {
          log('Unexpected error: ${error.toString()}');
        }
      });
    } catch (error) {
      log('Error: ${error.toString()}');
      if (error is DioException &&
          error.response != null &&
          error.response!.statusCode == 422) {
        emit(EditProfileError(error.response!.data['message'].toString()));
      } else {
        emit(EditProfileError(error.toString()));
      }
    }
  }

  // search prduct

  Set<ProductModel> searchProduct = {};

  TextEditingController textSearchControl = TextEditingController();

  searchProducts() {
    emit(SearchLoading());

    DioHelper.getData(
      url: "${EndPoints.search}${textSearchControl.text}",
    ).then((value) {
      for (var element in value.data['data']['products']) {
        searchProduct.add(ProductModel.fromJson(element));
      }
      log('Search Response: ${value.data.toString()}');
      emit(SearchSuccess());
    }).catchError((error) {
      emit(SearchError(error.toString()));
    });
  }

  // show Favorite

  Set<FavariteModel> favoriteProduct = {};
  showFavorite() {
    emit(ShowFavoriteLoading());
    DioHelper.getData(
      url: EndPoints.showFavorite,
      token: AppLocalStorage.getCacheData('token'),
    ).then((value) {
      for (var element in value.data['data']['data']) {
        favoriteProduct.add(FavariteModel.fromJson(element));
      }

      emit(ShowFavoriteSuccess());
    }).catchError((error) {
      emit(ShowFavoriteError(error.toString()));
    });
  }

  // add Favorite

  addFavorite(int id) {
    emit(AddFavoriteLoading());
    DioHelper.postData(
      url: EndPoints.addFavorite,
      token: AppLocalStorage.getCacheData('token'),
      data: {
        'product_id': id,
      },
    ).then((value) {
      showFavorite();
      emit(AddFavoriteSuccess());
    }).catchError((error) {
      emit(AddFavoriteError(error.toString()));
    });
  }

  // remove Favorite

  removeFavorite(int id) {
    emit(RemoveFavoriteLoading());
    DioHelper.postData(
      url: EndPoints.removeFavorite,
      token: AppLocalStorage.getCacheData('token'),
      data: {
        'product_id': id,
      },
    ).then((value) {
      favoriteProduct.removeWhere((element) => element.id == id);
      showFavorite();
      emit(RemoveFavoriteSuccess());
    }).catchError((error) {
      emit(RemoveFavoriteError(error.toString()));
    });
  }

// add cart
  void addToCart({required int product_id}) {
    emit(AddCartLoading());
    DioHelper.postData(
      url: EndPoints.addToCart,
      data: {'product_id': product_id},
      token: AppLocalStorage.getCacheData('token'),
    ).then((value) {
      emit(AddCartSuccess());
    }).catchError((error) {
      emit(AddCartError(error.toString()));
    });
  }

  TextEditingController passwordController = TextEditingController();
  deleteAccount({required String password, required BuildContext conext}) {
    emit(DeleteAccountLoading());
    log('Delete Account');
    DioHelper.postData(
      url: EndPoints.deleteProfile,
      token: AppLocalStorage.getCacheData('token'),
      data: {'current_password': passwordController.text},
    ).then((value) {
      AppLocalStorage.removeData('token');
      navToRemoveUntil(conext, const LoginView());
      emit(DeleteAccountSuccess());
    }).catchError((error) {
      emit(DeleteAccountError(error.toString()));
    });
  }

  LogOut(context) {
    emit(LogoutLoading());
    log('Logout');
    DioHelper.postData(
      url: EndPoints.logout,
      token: AppLocalStorage.getCacheData('token'),
      data: {},
    ).then((value) {
      AppLocalStorage.removeData('token');
      navToRemoveUntil(context, const LoginView());
      emit(LogoutSuccess());
    }).catchError((error) {
      emit(LogoutError(error.toString()));
    });
  }
}
