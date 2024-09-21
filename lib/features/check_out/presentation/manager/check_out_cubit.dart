import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/core/services/dio_helper.dart';
import 'package:mybook/core/services/end_points.dart';
import 'package:mybook/core/services/local_storage.dart';
import 'package:mybook/features/check_out/presentation/manager/check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());

  static CheckOutCubit get(context) => BlocProvider.of(context);

  void checkOut(context, String name, String phone, String address,
      String governorateId, String email) {
    emit(CheckOutLoading());
    DioHelper.postData(
        token: AppLocalStorage.getCacheData('token'),
        url: EndPoints.placeOrder,
        data: {
          'name': name,
          'governorate_id': governorateId,
          'phone': phone,
          'address': address,
          'email': email
        }).then((value) {
      emit(CheckOutSuccess());
    }).catchError((error) {
      emit(CheckOutError(error.toString()));
    });
  }
}
