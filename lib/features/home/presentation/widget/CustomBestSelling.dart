import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';

class CustomBestSelling extends StatelessWidget {
  const CustomBestSelling({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: ResponsiveLayout.getPaddingOnly(
              context: context, left: 15, right: 15),
          child: Row(
            children: <Widget>[
              Text('Best Selling', style: getTitleStyle(context)),
              const Spacer(),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
            ],
          ),
        ),
        Container(
          padding: ResponsiveLayout.getPaddingOnly(
              context: context, left: 15, right: 15),
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 300,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Container(
                    //   child: Image.asset(
                    //     'assets/Book Cover.png',
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ]),
                      height: 200,
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/Book Cover.png',
                            fit: BoxFit.cover,
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
                            child: Text('%30',
                                style: getSmallStyle(
                                    color: AppColors.white, fontSize: 13)),
                          ),
                        )
                      ]),
                    ),
                    Text(
                      'Book NameName',
                      style: getTitleStyle(context, fontSize: 17),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Software',
                      style: getBodyStyle(context, fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '300.0 L.E',
                      style: getSmallStyle(
                          decoration: TextDecoration.lineThrough, fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '200.0 L.E',
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
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
