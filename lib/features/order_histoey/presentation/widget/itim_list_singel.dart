import 'package:flutter/material.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/features/order_histoey/model/single_order_histoey/order_product.dart';

// ignore: must_be_immutable
class ItimListSingel extends StatelessWidget {
  ItimListSingel({super.key, required this.orderProduct});
  OrderProduct orderProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(
          orderProduct.productName!,
          style:
              getBodyStyle(context, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(
          "Quantity: ${orderProduct.orderProductQuantity}",
          style: getBodyStyle(context, fontSize: 13),
        ),
        trailing: Text(
          orderProduct.productPrice!,
          style:
              getBodyStyle(context, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
