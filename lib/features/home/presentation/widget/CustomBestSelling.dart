import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/features/home/presentation/manager/product/product_model.dart';
import 'package:shimmer/shimmer.dart';

class CustomBestSellrey extends StatelessWidget {
  CustomBestSellrey({
    super.key,
    required this.products,
  });

  List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: ResponsiveLayout.getPaddingOnly(
              context: context, left: 15, right: 15),
          child: Row(
            children: <Widget>[
              Text('Best Sellrey', style: getTitleStyle(context)),
              const Spacer(),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
            ],
          ),
        ),
        products.isNotEmpty
            ? Container(
                padding: ResponsiveLayout.getPaddingOnly(
                    context: context, left: 15, right: 15),
                height: ResponsiveLayout.getHeight(300, context),
                child: ListView.separated(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: ResponsiveLayout.getHeight(300, context),
                      width: ResponsiveLayout.getWidth(150, context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 10,
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ]),
                            height: ResponsiveLayout.getHeight(200, context),
                            child: Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  products[index].image.toString(),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Shimmer.fromColors(
                                      baseColor: AppColors.grey,
                                      highlightColor: AppColors.white,
                                      child: Container(
                                        height: ResponsiveLayout.getHeight(
                                            200, context),
                                        width: ResponsiveLayout.getWidth(
                                            150, context),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.green,
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  margin: const EdgeInsets.all(5),
                                  child: Text('%${products[index].discount}',
                                      style: getSmallStyle(
                                          color: AppColors.white,
                                          fontSize: 13)),
                                ),
                              )
                            ]),
                          ),
                          Text(
                            products[index].name.toString(),
                            style: getTitleStyle(context, fontSize: 17),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            products[index].category.toString(),
                            style: getBodyStyle(context, fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${products[index].price.toString()} L.E',
                            style: getSmallStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 13),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${products[index].priceAfterDiscount} L.E',
                            style: getSmallStyle(color: AppColors.green),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(
                      ResponsiveLayout.getGap(10, context),
                    );
                  },
                ),
              )
            : Container(
                padding: ResponsiveLayout.getPaddingOnly(
                    context: context, left: 15, right: 15),
                height: ResponsiveLayout.getHeight(300, context),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: ResponsiveLayout.getHeight(150, context),
                      width: ResponsiveLayout.getWidth(150, context),
                      child: Column(
                        children: [
                          Shimmer.fromColors(
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
                          ),
                          Gap(
                            ResponsiveLayout.getGap(10, context),
                          ),
                          Shimmer.fromColors(
                            baseColor: AppColors.grey,
                            highlightColor: AppColors.white,
                            child: Container(
                              height: ResponsiveLayout.getHeight(50, context),
                              width: ResponsiveLayout.getWidth(150, context),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(
                      ResponsiveLayout.getGap(10, context),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
