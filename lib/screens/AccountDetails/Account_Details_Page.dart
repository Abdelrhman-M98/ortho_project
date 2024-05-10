// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/imageProfile.dart';

class AccDetailsPage extends StatelessWidget {
  const AccDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 70.sp,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
        ),
        title: Text(
          "Personal details",
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w600,
            color: AppColors.dark_text,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: UploadImage(
                radius: 80.sp,
                isVisiable: true,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                "Name",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark_text,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "user name",
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w400,
                color: AppColors.SecondaryColor,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  width: 351.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.Primary_color),
                      color: AppColors.Profile_Container_color),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Abood",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w600,
                            color: AppColors.dark_text,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Update",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.w600,
                              color: AppColors.Primary_color,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "email address",
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w400,
                color: AppColors.SecondaryColor,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  width: 351.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.Primary_color),
                      color: AppColors.Profile_Container_color),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "example@g.com",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w600,
                            color: AppColors.dark_text,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Update",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.w600,
                              color: AppColors.Primary_color,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
