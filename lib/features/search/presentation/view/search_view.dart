import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/core/widgets/customItemOrder.dart';
import 'package:mybook/core/widgets/custom_text_field.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/auth/presentation/manager/auth_state.dart';
import 'package:mybook/features/home/presentation/manager/product/product_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        List<ProductModel> products = cubit.searchProduct;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Search',
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: ResponsiveLayout.getPaddingOnly(
                      context: context, left: 15, right: 15),
                  child: CustomTextField(
                    hintText: 'Search',
                    controller: cubit.textSearchControl,
                    suffix: Padding(
                      padding: ResponsiveLayout.getPaddingOnly(
                          context: context, right: 2),
                      child: IconButton(
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: AppColors.green,
                          ),
                          onPressed: () {
                            setState(() {
                              cubit.searchProducts();
                            });
                          },
                          icon:
                              const Icon(Icons.search, color: AppColors.white)),
                    ),
                  ),
                ),
                Gap(ResponsiveLayout.getGap(20, context)),
                Expanded(
                    child: products.isNotEmpty
                        ? ListView.builder(
                            itemBuilder: (context, index) {
                              if (products.isNotEmpty) {
                                return CustomItemOrder(
                                  productModel: products[index],
                                );
                              }
                              return null;
                            },
                            itemCount: cubit.searchProduct.length)
                        : const Center(child: Text('No Result Found'))),
              ],
            ),
          ),
        );
      },
    );
  }
}
