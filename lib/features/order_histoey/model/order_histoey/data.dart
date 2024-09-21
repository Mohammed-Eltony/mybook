import 'links.dart';
import 'meta.dart';
import 'order.dart';

class Data {
  List<Order>? orders;
  Meta? meta;
  Links? links;

  Data({this.orders, this.meta, this.links});

  factory Data.fromJson(
      Map<String, dynamic> json) {
    return Data(
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Order
              .fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta
              .fromJson(
                  json['meta'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : Links
              .fromJson(
                  json['links'] as Map<String, dynamic>),
    );
  }


}
