import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/features/order_histoey/model/single_order_histoey/single_order_histoey.dart';
import 'package:mybook/features/order_histoey/presentation/manager/order_histoey_cubit.dart';
import 'package:mybook/features/order_histoey/presentation/manager/order_histoey_state.dart';
import 'package:mybook/features/order_histoey/presentation/widget/itim_list_singel.dart';
import 'package:mybook/features/order_histoey/presentation/widget/itim_singel_order.dart';

// ignore: must_be_immutable
class SingelOrderView extends StatelessWidget {
  SingelOrderView({super.key, required this.id});
  int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderHistoeyCubit()..getSingelOrder(id),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Singel Order'),
        ),
        body: BlocBuilder<OrderHistoeyCubit, OrderHistoeyState>(
          builder: (context, state) {
            SingleOrderHistoeyModel? singleOrderHistoeyModel =
                OrderHistoeyCubit.get(context).singleOrderHistoeyModel;
            return singleOrderHistoeyModel == null
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(5),
                            ItimSingelOrder(
                              title: 'Name',
                              icon: Icons.person,
                              text: singleOrderHistoeyModel.data!.name!,
                            ),
                            ItimSingelOrder(
                              title: 'Email',
                              icon: Icons.alternate_email,
                              text: singleOrderHistoeyModel.data!.email!,
                            ),
                            ItimSingelOrder(
                              title: 'Phone',
                              icon: Icons.phone,
                              text: singleOrderHistoeyModel.data!.phone!,
                            ),
                            ItimSingelOrder(
                              title: 'address',
                              icon: Icons.location_on,
                              text: singleOrderHistoeyModel.data!.address!,
                            ),
                            ItimSingelOrder(
                              title: 'city',
                              icon: Icons.location_city,
                              text: singleOrderHistoeyModel.data!.governorate!,
                            ),
                            Row(
                              children: [
                                Text('Total: ', style: getTitleStyle(context)),
                                Text(
                                  '${singleOrderHistoeyModel.data!.total!} L.E',
                                  style: getTitleStyle(context,
                                      fontSize: 15, color: AppColors.primary),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      const Divider(),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return ItimListSingel(
                                orderProduct: singleOrderHistoeyModel
                                    .data!.orderProducts![index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(endIndent: 20, indent: 20);
                            },
                            itemCount: singleOrderHistoeyModel
                                .data!.orderProducts!.length),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
