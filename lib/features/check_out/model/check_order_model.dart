import 'data.dart';

class CheckOrderModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  CheckOrderModel({this.data, this.message, this.error, this.status});

  factory CheckOrderModel.fromJson(Map<String, dynamic> json) {
    return CheckOrderModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }
}
