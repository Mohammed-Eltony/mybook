import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';

class CustomHaederSlider extends StatelessWidget {
  const CustomHaederSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: ResponsiveLayout.getBorderRadius(20, context),
          ),
          child: Center(
            child: Text(
              'Item $index',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
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
      itemCount: 5,
    );
  }
}
