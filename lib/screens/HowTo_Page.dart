// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/screens/Upload_Page.dart';

class GuidHowTo extends StatelessWidget {
  const GuidHowTo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        titleText: 'Back',
        onTap: () {
          Navigator.of(context).pop();
        },
        barIcon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.Primary_color,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 36.h,
            ),
            Text(
              "Taking the perfect picture",
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                fontSize: 22.sp,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Follow these tips for capturing a great image:",
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: AppColors.SecondaryColor,
              ),
            ),
            SizedBox(
              height: 31.h,
            ),
            Row(
              children: [
                const Image(
                  image: AssetImage(
                    "assets/images/icons/Do_icon.png",
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Do's",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                    fontSize: 24.sp,
                    color: AppColors.Primary_color,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Image(
                    image: AssetImage(
                      "assets/images/icons/Positioning.png",
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Positioning",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: AppColors.dark_text,
                        ),
                      ),
                      Text(
                        softWrap: true,
                        "Make sure you're centered Capture from the collarbone up",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: AppColors.SecondaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Image(
                    image: AssetImage(
                      "assets/images/icons/Lighting.png",
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lighting",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: AppColors.dark_text,
                        ),
                      ),
                      Text(
                        softWrap: true,
                        "Avoid overhead or direct light Natural lighting is best",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: AppColors.SecondaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                const Image(
                  image: AssetImage(
                    "assets/images/icons/Doesn't_icon.png",
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Don'ts",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                    fontSize: 24.sp,
                    color: AppColors.Primary_color,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Image(
                    image: AssetImage(
                      "assets/images/icons/Accessories.png",
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Accessories",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: AppColors.dark_text,
                        ),
                      ),
                      Text(
                        softWrap: true,
                        "Glasses are not allowed Wear sunglasses or hats",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: AppColors.SecondaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Image(
                    image: AssetImage(
                      "assets/images/icons/Expression.png",
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expression",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: AppColors.dark_text,
                        ),
                      ),
                      Text(
                        softWrap: true,
                        "Show your best smile – natural and relaxed! and Keep your teeth gently closed, don't force it.",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: AppColors.SecondaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            BtnWidget(
              btnText: "Start Scan",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const UploadPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
