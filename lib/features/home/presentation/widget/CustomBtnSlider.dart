import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomBtnSlider extends StatefulWidget {
  const CustomBtnSlider({
    super.key,
  });

  @override
  State<CustomBtnSlider> createState() => _CustomBtnSliderState();
}

class _CustomBtnSliderState extends State<CustomBtnSlider> {
  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
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
            onPageChanged: (index, reason) {
              setState(() {
                pageindex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
          itemCount: 5,
        ),
        Gap(ResponsiveLayout.getHeight(10, context)),
        SmoothPageIndicator(
          controller: PageController(initialPage: pageindex),
          count: 5,
          axisDirection: Axis.horizontal,
          effect: const SlideEffect(
              spacing: 10,
              radius: 50,
              dotWidth: 20,
              dotHeight: 20,
              paintStyle: PaintingStyle.stroke,
              strokeWidth: 2,
              dotColor: AppColors.green,
              activeDotColor: AppColors.primary),
        )
      ],
    );
  }
}
