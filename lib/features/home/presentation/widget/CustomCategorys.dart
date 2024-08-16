import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';

class CustomCategorys extends StatelessWidget {
  const CustomCategorys({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: ResponsiveLayout.getPaddingOnly(
              context: context, left: 15, right: 15),
          child: Row(
            children: <Widget>[
              Text('Best Selling', style: getTitleStyle(context)),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
        Container(
          padding: ResponsiveLayout.getPaddingOnly(
              context: context, left: 15, right: 15),
          height: 100,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 120,
                  height: 100,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/imag_Categorys.jpg',
                        ),
                      ),
                      Container(
                          height: 100,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.black.withOpacity(0.5),
                          ),
                          child: Center(
                              child: Text(
                            'Api & Dart Programming',
                            textAlign: TextAlign.center,
                            style: getBodyStyle(context,
                                color: AppColors.white, fontSize: 13),
                          )))
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Gap(ResponsiveLayout.getGap(5, context));
              },
              itemCount: 10),
        ),
      ],
    );
  }
}
