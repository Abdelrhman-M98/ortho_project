// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
 
  @override
  State<ProfilePage> createState() => _ProfilePageState();

}


class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 45.h,
            ),
            Center(
              child: Text(
                "User Profile",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark_text,
                  fontSize: 20.sp,
                ),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              children: [
                Container(
                  width: 71.w,
                  height: 71.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/photos/onBording.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        fontFamily: "Montesrrat",
                        fontWeight: FontWeight.w600,
                        color: AppColors.dark_text,
                        fontSize: 24.sp,
                      ),
                    ),
                    Container(
                      color: AppColors.Type_container_color,
                      width: 74.w,
                      height: 27.h,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
