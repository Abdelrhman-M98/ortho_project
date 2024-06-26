// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/screens/UserGuid/HowTo_Page.dart';
import 'package:ortho/screens/UserHomePage/User_Home_Page.dart';

class GuidPage extends StatelessWidget {
  const GuidPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Back', // Pass the title text here
        onTap: () {
          Route route =
              MaterialPageRoute(builder: (context) => const UserHomePage());
          Navigator.pushReplacement(context, route);
          // Handle onTap action if needed
        },
        barIcon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.Primary_color,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.h,
            ),
            const Center(
              child: Image(
                image: AssetImage(
                  "assets/images/photos/Guide_photo.png",
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Get Started Right with Ortho AI",
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
                fontSize: 22.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                "Before we start analyzing smiles, let's quickly guide you through a tutorial to help you capture the perfect image for precise results. Follow these steps for the best experience. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.SecondaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            GestureDetector(
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (context) => const GuidHowTo());
                Navigator.pushReplacement(context, route);
              },
              child: const Image(
                image: AssetImage(
                  "assets/images/icons/Guide_screen_icon.png",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      // Added a comma here
    );
  }
}
