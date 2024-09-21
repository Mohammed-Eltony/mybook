import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/core/functions/navigator.dart';
import 'package:mybook/core/services/dio_helper.dart';
import 'package:mybook/core/services/end_points.dart';
import 'package:mybook/core/services/local_storage.dart';
import 'package:mybook/features/cart/model/cart_model.dart';
import 'package:mybook/features/cart/presentation/manager/cart_cubit_state.dart';
import 'package:mybook/features/check_out/model/check_order_model.dart';
import 'package:mybook/features/check_out/presentation/view/check_out_view.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartCubitInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  CartModel? cartModel;

  void getCart() {
    emit(CartCubitLoading());
    DioHelper.getData(
      url: EndPoints.cart,
      token: '${AppLocalStorage.getCacheData('token')}',
    ).then((value) {
      cartModel = CartModel.fromJson(value.data);
      emit(CartCubitSuccess());
    }).catchError((error) {
      emit(CartCubitError(error.toString()));
    });
  }

  void deleteCart({required int cart_item_id}) {
    emit(CartCubitLoading());
    DioHelper.postData(
        url: EndPoints.removeCart,
        token: '${AppLocalStorage.getCacheData('token')}',
        data: {'cart_item_id': cart_item_id}).then((value) {
      getCart();
      emit(CartCubitSuccess());
    }).catchError((error) {
      emit(CartCubitError(error.toString()));
    });
  }

  void updateCart({required int cart_item_id, required int quantity}) {
    emit(CartCubitLoading());

    log('$cart_item_id $quantity');

    DioHelper.postData(
            token: '${AppLocalStorage.getCacheData('token')}',
            url: EndPoints.updateCart,
            data: {'cart_item_id': cart_item_id, 'quantity': quantity})
        .then((value) {
      getCart();
      emit(CartCubitSuccess());
    }).catchError((error) {
      emit(CartCubitError(error.toString()));
    });
  }

  void check_out(context) {
    emit(CheckoutLoading());

    final token = AppLocalStorage.getCacheData('token');
    log('Token: $token'); // نقطة فحص 1
    if (token != null) {
      DioHelper.getData(
        url: EndPoints.checkout,
        token: '$token',
      ).then((value) {
        log('Response data: ${value.data}'); // نقطة فحص 2
        if (value.data != null) {
          try {
            final checkOrderModel = CheckOrderModel.fromJson(value.data);
            log('CheckOrderModel created successfully'); // نقطة فحص 3
            navTo(
              context,
              CheckOutView(
                checkOrderModel: checkOrderModel,
              ),
            );
          } catch (e) {
            log('Error parsing CheckOrderModel: $e'); // نقطة فحص 4
            emit(CheckoutError('Error parsing data'));
          }
        } else {
          log('Error: Response data is null');
          emit(CheckoutError('Response data is null'));
        }

        emit(CheckoutSuccess());
      }).catchError((error) {
        log('Dio error: $error'); // نقطة فحص 5
        emit(CheckoutError(error.toString()));
      });
    } else {
      log('Token is null');
      emit(CheckoutError('Token is null'));
    }
  }
}
