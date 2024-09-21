// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/features/check_out/model/check_order_model.dart';

// ignore: must_be_immutable
class CheckOutItem extends StatelessWidget {
  CheckOutItem({super.key, required this.checkOrderModel, required this.index});
  CheckOrderModel checkOrderModel;
  int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(
          checkOrderModel.data!.cartItems![index].itemProductName!,
          style:
              getBodyStyle(context, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(
          "Quantity: ${checkOrderModel.data!.cartItems![index].itemQuantity!}",
          style: getBodyStyle(context, fontSize: 13),
        ),
        trailing: Text(
          checkOrderModel.data!.cartItems![index].itemProductPrice!,
          style:
              getBodyStyle(context, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
