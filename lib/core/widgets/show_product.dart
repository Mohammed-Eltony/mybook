import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/functions/custom_SnackBar.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/core/widgets/custom_btn.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/auth/presentation/manager/auth_state.dart';
import 'package:mybook/features/home/presentation/manager/product/product_model.dart';
import 'package:shimmer/shimmer.dart';

class ShowProduct extends StatefulWidget {
  ShowProduct({required this.product, super.key});

  ProductModel product;

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  bool isFavorite = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var cubit = AuthCubit.get(context);

    for (var element in cubit.favoriteProduct) {
      if (element.id == widget.product.id) {
        log(isFavorite.toString());
        setState(() {
          isFavorite = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                if (isFavorite == true) {
                  cubit.removeFavorite(widget.product.id!);
                } else {
                  cubit.addFavorite(widget.product.id!);
                }

                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: isFavorite == true
                  ? const Icon(
                      Icons.favorite,
                      color: AppColors.green,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: AppColors.green,
                    ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AddCartSuccess) {
              showErrorDialog(context, 'Success', color: Colors.green);
            } else if (state is AddCartError) {
              showErrorDialog(context, state.error);
            }
          },
          child: CustomBtn(
            text: 'Add To Cart',
            onPressed: () {
              cubit.addToCart(product_id: widget.product.id!);
            },
            width: ResponsiveLayout.getWidth(300, context),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: ResponsiveLayout.getPadding(15, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: ResponsiveLayout.getHeight(300, context),
                    width: ResponsiveLayout.getWidth(200, context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.product.image.toString(),
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Shimmer.fromColors(
                            baseColor: AppColors.grey,
                            highlightColor: AppColors.white,
                            child: Container(
                              height: ResponsiveLayout.getHeight(200, context),
                              width: ResponsiveLayout.getWidth(150, context),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Gap(ResponsiveLayout.getGap(20, context)),
                Center(
                  child: Text(
                    '${widget.product.name}',
                    textAlign: TextAlign.center,
                    style: getTitleStyle(
                      context,
                    ),
                  ),
                ),
                Gap(ResponsiveLayout.getGap(20, context)),
                Row(
                  children: [
                    Text('Price : ',
                        style: getTitleStyle(context, color: AppColors.green)),
                    Text(
                      '${widget.product.price} L.E',
                      style: getSmallStyle(
                          decoration: TextDecoration.lineThrough, fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(' - ', style: getTitleStyle(context)),
                    Text(
                      '${widget.product.priceAfterDiscount} L.E',
                      style: getSmallStyle(color: AppColors.green),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Gap(ResponsiveLayout.getGap(20, context)),
                Text('Description',
                    style: getTitleStyle(context, color: AppColors.green)),
                Text(
                  '${widget.product.description}'
                      .replaceAll("<p>", "")
                      .replaceAll("</p>", ""),
                  style: getBodyStyle(
                    context,
                  ),
                ),
                SizedBox(
                  height: ResponsiveLayout.getHeight(100, context),
                )
              ],
            ),
          ),
        ));
  }
}
