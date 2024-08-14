// import 'package:flutter/material.dart';
// import 'package:mybook/core/utils/text_style.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const Drawer(),
//       appBar: AppBar(
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text("Hi,Mohmammed", style: getTitleStyle(context)),
//             Text("What are you reading today", style: getSmallStyle()),
//           ],
//         ),
//         actions: const [
//           CircleAvatar(
//             radius: 35,
//             backgroundImage: AssetImage('assets/user avatar.png'),
//           )
//         ],
//       ),
//       body:Column(
//         children: <Widget>[

//         ],
//       )
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/features/home/presentation/widget/CustomDrawer.dart';
import 'package:mybook/features/home/presentation/widget/CustomHaederSlider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.green],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        borderRadius: ResponsiveLayout.getBorderRadius(20, context),
      ),
      drawer: const CustomDrawer(),
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Hi,Mohmammed", style: getTitleStyle(context)),
              Text("What are you reading today", style: getSmallStyle()),
            ],
          ),
          actions: const [
            CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.primary,
              backgroundImage: AssetImage('assets/user avatar.png'),
            )
          ],
          leading: customLedingDrawer(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Gap(
                ResponsiveLayout.getGap(10, context),
              ),
              const CustomHaederSlider(),
              Gap(
                ResponsiveLayout.getGap(10, context),
              ),
              Padding(
                padding: ResponsiveLayout.getPaddingOnly(
                    context: context, left: 15, right: 15),
                child: Row(
                  children: <Widget>[
                    Text('Best Selling', style: getTitleStyle(context)),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
              Container(
                padding: ResponsiveLayout.getPadding(15, context),
                height: 400,
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
                                          color: AppColors.white,
                                          fontSize: 13)),
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
                                decoration: TextDecoration.lineThrough,
                                fontSize: 13),
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
          ),
        ),
      ),
    );
  }
//

//

  IconButton customLedingDrawer() {
    return IconButton(
      onPressed: _handleMenuButtonPressed,
      icon: ValueListenableBuilder<AdvancedDrawerValue>(
        valueListenable: _advancedDrawerController,
        builder: (_, value, __) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Icon(
              value.visible ? Icons.clear : Icons.menu,
              key: ValueKey<bool>(value.visible),
            ),
          );
        },
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
