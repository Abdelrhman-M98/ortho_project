// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class SocialBTN extends StatelessWidget {
  final String btnText;
  final Function()? onTap;
  final Color BtnColor;
  final String BtnIcon;

  const SocialBTN(
      {super.key,
      required this.btnText,
      required this.onTap,
      required this.BtnColor,
      required this.BtnIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: BtnColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(BtnIcon),
            ),
            SizedBox(
              width: 7.w,
            ),
            Text(
              btnText,
              style: const TextStyle(
                color: AppColors.White_text,
                fontFamily: "Nunito",
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
