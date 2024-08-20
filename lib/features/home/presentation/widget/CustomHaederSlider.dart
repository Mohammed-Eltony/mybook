import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomHaederSlider extends StatelessWidget {
  CustomHaederSlider({
    super.key,
    required this.imageSlider,
  });

  List imageSlider = [];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        if (imageSlider.isNotEmpty) {
          return ClipRRect(
            borderRadius: BorderRadius.all(
              ResponsiveLayout.getRadius(20, context),
            ),
            child: Image.network(
              imageSlider[index]['image'],
              errorBuilder: (context, error, stackTrace) {
                return Shimmer.fromColors(
                  baseColor: AppColors.grey,
                  highlightColor: AppColors.white,
                  child: Container(
                    height: ResponsiveLayout.getHeight(200, context),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          ResponsiveLayout.getBorderRadius(10, context),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return SizedBox(
            width: double.infinity,
            child: Shimmer.fromColors(
              baseColor: AppColors.grey,
              highlightColor: AppColors.white,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(ResponsiveLayout.getHeight(20, context)),
                  ),
                ),
              ),
            ),
          );
        }
      },
      options: CarouselOptions(
        height: ResponsiveLayout.getHeight(130, context),
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,

        enlargeFactor: 0.3,
        // onPageChanged: ,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: imageSlider.length,
    );
  }
}
