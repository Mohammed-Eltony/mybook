import 'data.dart';

class SingleOrderHistoeyModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  SingleOrderHistoeyModel({this.data, this.message, this.error, this.status});

  factory SingleOrderHistoeyModel.fromJson(
      Map<String, dynamic> json) {
    return SingleOrderHistoeyModel(
      data: json['data'] == null
          ? null
          : Data
              .fromJson(
                  json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }


}
