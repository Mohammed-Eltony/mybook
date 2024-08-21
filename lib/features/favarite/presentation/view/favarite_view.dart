import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/core/widgets/customItemOrder.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/auth/presentation/manager/auth_state.dart';
import 'package:mybook/features/home/presentation/manager/product/product_model.dart';

class FavariteView extends StatelessWidget {
  const FavariteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        List<ProductModel> products = cubit.searchProduct;
        return Scaffold(
            appBar: AppBar(
              title: const Text('Favarite'),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return CustomItemOrder(productModel: products[index]);
              },
            ));
      },
    );
  }
}
