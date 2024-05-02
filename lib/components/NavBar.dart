// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class navBar extends StatefulWidget {
  final BuildContext context;
  final PageController homeController;

  const navBar({
    super.key,
    required this.context,
    required this.homeController,
  });

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 90.0,
        ),
        child: NavigationBar(
          animationDuration: const Duration(seconds: 3),
          surfaceTintColor: Colors.transparent,
          indicatorColor: AppColors.Primary_color_shade,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          selectedIndex: _selectedIndex,
          height: 70.h,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
            widget.homeController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: Image.asset(
                'assets/images/icons/Home_fill.png', // Provide your custom icon asset path here
                width: 40.w,
                height: 40.h,
                color: AppColors.Primary_color,
              ),
              icon: Image.asset(
                'assets/images/icons/Home_empty.png', // Provide your custom icon asset path here
                width: 40.w,
                height: 40.h,
                color: AppColors.SecondaryColor,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Image.asset(
                'assets/images/icons/Profile_fill.png', // Provide your custom icon asset path here
                width: 40.w,
                height: 40.h,
                color: AppColors.Primary_color,
              ),
              icon: Image.asset(
                'assets/images/icons/Profile_Empt.png', // Provide your custom icon asset path here
                width: 40.w,
                height: 40.h,
                color: AppColors.SecondaryColor,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
