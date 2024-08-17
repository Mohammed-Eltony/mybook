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

  List imagePuth = [
    'assets/s1.jpg',
    'assets/s2.jpg',
    'assets/s3.jpg',
    'assets/s4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemBuilder: (context, index, realIndex) {
            return Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ResponsiveLayout.getHeight(20, context),
                ),
              ),
              height: ResponsiveLayout.getHeight(130, context),
              width: double.infinity,
              child: ClipRRect(
                child: Image.asset(
                  imagePuth[index],
                  fit: BoxFit.fill,
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
          itemCount: imagePuth.length,
        ),
        Gap(ResponsiveLayout.getHeight(10, context)),
        SmoothPageIndicator(
          controller: PageController(initialPage: pageindex),
          count: imagePuth.length,
          axisDirection: Axis.horizontal,
          effect: SlideEffect(
              spacing: 10,
              radius: 50,
              dotWidth: ResponsiveLayout.getWidth(15, context),
              dotHeight: ResponsiveLayout.getHeight(15, context),
              paintStyle: PaintingStyle.stroke,
              strokeWidth: 2,
              dotColor: AppColors.green,
              activeDotColor: AppColors.primary),
        )
      ],
    );
  }
}
