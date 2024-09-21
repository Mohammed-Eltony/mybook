import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class ShmmerListItma extends StatelessWidget {
  ShmmerListItma({
    required this.itemCount,
    super.key,
  });
  int itemCount;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                width: double.infinity,
                height: 150,
                child: Row(children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[350]!,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 120,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[350]!,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 20,
                          width: 220,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[350]!,
                        highlightColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          height: 20,
                          width: 200,
                        ),
                      ),
                      const Spacer(),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[350]!,
                        highlightColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          height: 20,
                          width: 180,
                        ),
                      ),
                      const Spacer(),
                    ],
                  )
                ]),
              );
            }));
  }
}
