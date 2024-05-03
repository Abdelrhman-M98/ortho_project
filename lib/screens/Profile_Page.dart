// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Pie_Chart.dart';
import 'package:ortho/models/dataOfScan.dart';
import 'package:ortho/screens/Account_Details_Page.dart';
import 'package:ortho/screens/Login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int validScans = items.where((item) => item.IsimageVailed == 1).length;
  int UnvalidScans = items.where((item) => item.IsimageVailed == 0).length;
  int Scans = items.length;
  static List<ListItem> items = [
    ListItem(
      date_of_scan: DateTime.now(),
      beforeImage: 'assets/images/photos/uploaded.jpg',
      afterImage: 'assets/images/photos/uploaded.jpg',
      IsimageVailed: 0,
    ),
    ListItem(
      date_of_scan: DateTime.now(),
      beforeImage: 'assets/images/photos/uploaded.jpg',
      afterImage: 'assets/images/photos/uploaded.jpg',
      IsimageVailed: 0,
    ),
    ListItem(
      date_of_scan: DateTime.now(),
      beforeImage: 'assets/images/photos/uploaded.jpg',
      afterImage: 'assets/images/photos/uploaded.jpg',
      IsimageVailed: 0,
    ),
    ListItem(
      date_of_scan: DateTime.now(),
      beforeImage: 'assets/images/photos/uploaded.jpg',
      afterImage: 'assets/images/photos/uploaded.jpg',
      IsimageVailed: 1,
    ),
    ListItem(
      date_of_scan: DateTime.now(),
      beforeImage: 'assets/images/photos/uploaded.jpg',
      afterImage: 'assets/images/photos/uploaded.jpg',
      IsimageVailed: 1,
    ),
    ListItem(
      date_of_scan: DateTime.now(),
      beforeImage: 'assets/images/photos/uploaded.jpg',
      afterImage: 'assets/images/photos/uploaded.jpg',
      IsimageVailed: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  width: 20.w,
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: AppColors.Type_container_color),
                      ),
                      //color: AppColors.White,
                      width: 74.w,
                      height: 27.h,
                      child: Center(
                        child: Text("Dintist",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: AppColors.Type_container_color)),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                "Profile",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark_text,
                  fontSize: 20.sp,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 351.w,
              height: 125.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.Primary_color),
                  color: AppColors.Profile_Container_color),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 16,
                      left: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Personal details",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w600,
                            color: AppColors.Primary_color,
                            fontSize: 18.sp,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AccDetailsPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Edit",
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
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      left: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Change password",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w600,
                            color: AppColors.Primary_color,
                            fontSize: 18.sp,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Edit",
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
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                "History",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark_text,
                  fontSize: 20.sp,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 351.w,
              height: 136.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.Primary_color),
                  color: AppColors.Profile_Container_color),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      right: 16,
                      left: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "($Scans) Scans",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w700,
                            color: AppColors.Primary_color,
                            fontSize: 19.sp,
                          ),
                        ),
                        Text(
                          "$validScans Completed , $UnvalidScans Draft",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w500,
                            color: AppColors.Primary_color,
                            fontSize: 13.sp,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              child: Text(
                                "View all scans",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.Type_container_color,
                                  fontSize: 12.sp,
                                ),
                              ),
                              onTap: () {},
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              child: const Icon(
                                size: 10,
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.Type_container_color,
                              ),
                              onTap: () {},
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: CircularProgress(items: items),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage(
                      "assets/images/icons/Send_empty.png",
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Share this app",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                        color: AppColors.SecondaryColor),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.SecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Image(
                    image: AssetImage(
                      "assets/images/icons/star.png",
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Rate us on playstore",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                        color: AppColors.SecondaryColor),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.SecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: const Image(
                        image: AssetImage(
                          "assets/images/icons/logout.png",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w400,
                          color: AppColors.Fail_Text),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
