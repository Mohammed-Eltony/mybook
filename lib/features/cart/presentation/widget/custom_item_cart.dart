import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:shimmer/shimmer.dart';

class CustomItemCart extends StatelessWidget {
  const CustomItemCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // navTo(context, ShowProduct(product: productModel));
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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                width: ResponsiveLayout.getWidth(100, context),
                'assets/Book Cover.png',
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
            Gap(ResponsiveLayout.getGap(10, context)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name of product',
                    style: getTitleStyle(context, fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                      Text('1', style: getTitleStyle(context)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.remove)),
                    ],
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.red,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '200 L.E',
                      style: getSmallStyle(
                          decoration: TextDecoration.lineThrough, fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '100 L.E',
                      style: getSmallStyle(color: AppColors.green),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
