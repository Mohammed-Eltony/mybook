import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/core/services/dio_helper.dart';
import 'package:mybook/core/services/end_points.dart';
import 'package:mybook/core/services/local_storage.dart';
import 'package:mybook/features/order_histoey/model/order_histoey/order_histoey.dart';
import 'package:mybook/features/order_histoey/model/single_order_histoey/single_order_histoey.dart';
import 'package:mybook/features/order_histoey/presentation/manager/order_histoey_state.dart';

class OrderHistoeyCubit extends Cubit<OrderHistoeyState> {
  OrderHistoeyCubit() : super(OrderHistoeyInitial());

  static OrderHistoeyCubit get(context) => BlocProvider.of(context);
  OrderHistoeyModel? orderHistoeyModel;
  SingleOrderHistoeyModel? singleOrderHistoeyModel;

  void getOrderHistory() {
    emit(OrderHistoeyLoading());
    DioHelper.getData(
            url: EndPoints.orderHistory,
            token: AppLocalStorage.getCacheData('token'))
        .then((value) {
      orderHistoeyModel = OrderHistoeyModel.fromJson(value.data);
      emit(OrderHistoeySuccess());
    }).catchError((onError) {
      emit(OrderHistoeyError());
    });
  }

  void getSingelOrder(int id) {
    emit(SingelOrderLoading());
    DioHelper.getData(
            url: '${EndPoints.showOrderHistory}$id',
            token: AppLocalStorage.getCacheData('token'))
        .then((value) {
      singleOrderHistoeyModel = SingleOrderHistoeyModel.fromJson(value.data);
      emit(SingelOrderSuccess());
    }).catchError((onError) {
      emit(SingelOrderError());
    });
  }
}
