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
import 'package:mybook/features/home/presentation/widget/CustomBestSelling.dart';
import 'package:mybook/features/home/presentation/widget/CustomBtnSlider.dart';
import 'package:mybook/features/home/presentation/widget/CustomCategorys.dart';
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
        floatingActionButton: SizedBox(
          width: 45,
          height: 45,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.primary,
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.white,
            ),
          ),
        ),
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Hi,Mohmammed ali", style: getTitleStyle(context)),
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
              const CustomBestSelling(),
              const CustomBtnSlider(),
              Gap(
                ResponsiveLayout.getGap(10, context),
              ),
              const CustomCategorys(),
              Gap(
                ResponsiveLayout.getGap(10, context),
              ),
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
