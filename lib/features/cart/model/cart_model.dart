import 'data.dart';

class CartModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  CartModel({this.data, this.message, this.error, this.status});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }
}
