import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/functions/navigator.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/core/widgets/show_product.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/home/presentation/manager/product/product_model.dart';
import 'package:shimmer/shimmer.dart';

class CustomItemOrder extends StatelessWidget {
  final ProductModel productModel;

  const CustomItemOrder({required this.productModel, super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);

    bool isFavorite =
        cubit.favoriteProduct.any((element) => element.id == productModel.id);

    return InkWell(
      onTap: () {
        navTo(context, ShowProduct(product: productModel));
      },
      child: Container(
        height: ResponsiveLayout.getHeight(150, context),
        margin: EdgeInsets.all(ResponsiveLayout.getWidth(10, context)),
        padding: ResponsiveLayout.getPadding(10, context),
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.grey,
            ),
            borderRadius: ResponsiveLayout.getBorderRadius(20, context),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 1,
                offset: const Offset(1, 3), // changes position of shadow
              ),
            ]),
        child: Row(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  width: ResponsiveLayout.getWidth(100, context),
                  productModel.image.toString(),
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
                  child: Text('%${productModel.discount}',
                      style:
                          getSmallStyle(color: AppColors.white, fontSize: 13)),
                ),
              )
            ]),
            Gap(ResponsiveLayout.getGap(10, context)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${productModel.name}',
                    style: getTitleStyle(context, fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    productModel.category ?? '',
                    style: getBodyStyle(context, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${productModel.price} L.E',
                    style: getSmallStyle(
                        decoration: TextDecoration.lineThrough, fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${productModel.priceAfterDiscount} L.E',
                    style: getSmallStyle(color: AppColors.green),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (isFavorite) {
                      cubit.removeFavorite(productModel.id!);
                    } else {
                      cubit.addFavorite(productModel.id!);
                    }
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.green,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.green,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
