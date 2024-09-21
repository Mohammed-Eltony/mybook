class Order {
  int? id;
  String? orderCode;
  String? orderDate;
  String? status;
  String? total;

  Order({this.id, this.orderCode, this.orderDate, this.status, this.total});

  factory Order.fromJson(
      Map<String, dynamic> json) {
    return Order(
      id: json['id'] as int?,
      orderCode: json['order_code'] as String?,
      orderDate: json['order_date'] as String?,
      status: json['status'] as String?,
      total: json['total'] as String?,
    );
  }

}
