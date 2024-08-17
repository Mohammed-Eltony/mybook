import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';

import 'package:mybook/features/home/presentation/view/home_view.dart';
import 'package:mybook/features/profile/presentation/view/profile_view.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int _selectedIndex = 0;

  List<Widget> screenViews = [
    const HomeView(),
    const Center(child: Text('Search')),
    const Center(child: Text('favorite')),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenViews[_selectedIndex],
      bottomNavigationBar: DotCurvedBottomNav(
        scrollController: ScrollController(),
        hideOnScroll: true,
        indicatorColor: AppColors.primary,
        backgroundColor: AppColors.green,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.ease,
        selectedIndex: _selectedIndex,
        margin: ResponsiveLayout.getMargin(10, context),
        indicatorSize: 5,
        borderRadius: 25,
        height: ResponsiveLayout.getHeight(70, context),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home,
            color: _selectedIndex == 0 ? AppColors.primary : AppColors.white,
          ),
          Icon(
            Icons.search,
            color: _selectedIndex == 1 ? AppColors.primary : AppColors.white,
          ),
          Icon(
            Icons.favorite,
            color: _selectedIndex == 2 ? AppColors.primary : AppColors.white,
          ),
          Icon(
            Icons.person,
            color: _selectedIndex == 3 ? AppColors.primary : AppColors.white,
          ),
        ],
      ),
    );
  }
}
