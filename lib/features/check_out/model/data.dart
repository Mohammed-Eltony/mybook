import 'cart_item.dart';
import 'user.dart';

class Data {
  int? id;
  User? user;
  String? total;
  List<CartItem>? cartItems;

  Data({this.id, this.user, this.total, this.cartItems});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      total: json['total'] as String?,
      cartItems: (json['cart_items'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
