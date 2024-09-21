import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/core/services/dio_helper.dart';
import 'package:mybook/core/services/end_points.dart';
import 'package:mybook/core/services/local_storage.dart';
import 'package:mybook/features/update-password%20copy/presentation/manager/update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit() : super(UpdatePasswordInitial());

  static UpdatePasswordCubit get(context) => BlocProvider.of(context);

  void updatePassword(
      {required String current_password,
      required String new_password,
      required String new_password_confirmation}) {
    emit(UpdatePasswordLoading());
    DioHelper.postData(
        token: AppLocalStorage.getCacheData('token'),
        url: EndPoints.updatePassword,
        data: {
          'current_password': current_password,
          'new_password': new_password,
          'new_password_confirmation': new_password_confirmation,
        }).then((value) {
      emit(UpdatePasswordSuccess());
    }).catchError((onError) {
      emit(UpdatePasswordError());
    });
  }
}
