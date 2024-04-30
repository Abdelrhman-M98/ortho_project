// ignore_for_file: file_names, non_constant_identifier_names, use_key_in_widget_constructors, empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class SocialBTN extends StatelessWidget {
  final String btnText;
  final Function()? onTap;
  final Color BtnColor;
  final String BtnIcon;

  const SocialBTN({
    required this.btnText,
    required this.onTap,
    required this.BtnColor,
    required this.BtnIcon, // Accept border color as a parameter
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.White,
          // Set border color
          side: const BorderSide(
            color: AppColors.Google_Color,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 21.w,
              height: 21.h,
              image: AssetImage(BtnIcon),
            ),
            SizedBox(
              width: 7.w,
            ),
            Text(
              btnText,
              style: TextStyle(
                color: AppColors.dark_text,
                fontFamily: "Nunito",
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
