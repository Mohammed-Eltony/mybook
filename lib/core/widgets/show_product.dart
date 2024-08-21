import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/core/widgets/custom_btn.dart';
import 'package:mybook/features/home/presentation/manager/product/product_model.dart';
import 'package:shimmer/shimmer.dart';

class ShowProduct extends StatelessWidget {
  ShowProduct({required this.product, super.key});

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: AppColors.green,
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomBtn(
          text: 'Add To Cart',
          onPressed: () {},
          width: ResponsiveLayout.getWidth(300, context),
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
                        product.image.toString(),
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
                    '${product.name}',
                    textAlign: TextAlign.center,
                    style: getTitleStyle(
                      context,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Gap(ResponsiveLayout.getGap(20, context)),
                Row(
                  children: [
                    Text('Price : ',
                        style: getTitleStyle(context, color: AppColors.green)),
                    Text(
                      '${product.price} L.E',
                      style: getSmallStyle(
                          decoration: TextDecoration.lineThrough, fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(' - ', style: getTitleStyle(context)),
                    Text(
                      '${product.priceAfterDiscount} L.E',
                      style: getSmallStyle(color: AppColors.green),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Gap(ResponsiveLayout.getGap(20, context)),
                Text('Description',
                    style: getTitleStyle(context, color: AppColors.green)),
                Text(
                  '${product.description}'
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
