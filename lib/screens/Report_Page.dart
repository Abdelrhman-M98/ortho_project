// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/screens/Login_page.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.Primary_color,
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              color: AppColors.Primary_color,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        title: Text(
          "Reoprt",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w400,
            color: AppColors.Primary_color,
            fontSize: 16.sp,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () {
                  print("share");
                },
                child: Image.asset(
                  "assets/images/icons/Send_colord.png",
                  width: 30.w, // Adjust the width as needed
                  height: 30.h, // Adjust the height as needed
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Report",
          style: TextStyle(
            fontSize: 30.sp,
          ),
        ),
      ),
    );
  }
}
