import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/functions/navigator.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/core/widgets/show_category.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/home/presentation/manager/category_model/category_model.dart';
import 'package:shimmer/shimmer.dart';

class CustomCategorys extends StatelessWidget {
  CustomCategorys({required this.categorys, super.key});

  List<CategoryModel> categorys;

  @override
  Widget build(BuildContext context) {
    if (categorys.isNotEmpty) {
      return Column(
        children: <Widget>[
          Padding(
            padding: ResponsiveLayout.getPaddingOnly(
                context: context, left: 15, right: 15),
            child: Row(
              children: <Widget>[
                Text('Categorys', style: getTitleStyle(context)),
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
                  return InkWell(
                    onTap: () async {
                      navTo(
                          context,
                          ShowCategory(
                            category: categorys[index],
                          ));
                    },
                    child: SizedBox(
                      height: ResponsiveLayout.getHeight(100, context),
                      width: ResponsiveLayout.getWidth(120, context),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/imag_Categorys.jpg',
                            ),
                          ),
                          Container(
                              height: ResponsiveLayout.getHeight(100, context),
                              width: ResponsiveLayout.getWidth(120, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.black.withOpacity(0.5),
                              ),
                              child: Center(
                                  child: Text(
                                categorys[index].name.toString(),
                                textAlign: TextAlign.center,
                                style: getBodyStyle(context,
                                    color: AppColors.white, fontSize: 13),
                              )))
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Gap(ResponsiveLayout.getGap(5, context));
                },
                itemCount: categorys.length),
          ),
        ],
      );
    } else {
      return Container(
          padding: ResponsiveLayout.getPaddingOnly(
              context: context, left: 15, right: 15),
          height: ResponsiveLayout.getHeight(100, context),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Shimmer.fromColors(
                baseColor: AppColors.grey,
                highlightColor: AppColors.white,
                child: Container(
                  height: ResponsiveLayout.getHeight(100, context),
                  width: ResponsiveLayout.getWidth(120, context),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Gap(
                ResponsiveLayout.getGap(10, context),
              );
            },
            itemCount: 3,
          ));
    }
  }
}
