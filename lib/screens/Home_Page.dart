// ignore_for_file: file_names, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/HomeCard.dart';
import 'package:ortho/components/Search_Bar.dart';
import 'package:ortho/models/dataOfScan.dart';
import 'package:ortho/screens/Guid_page.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<ListItem> items = [
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
      IsimageVailed: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return items.isNotEmpty
        ? Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 45.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            'Welcome, Islam',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColors.dark_text,
                              fontFamily: 'Montserrat',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            'Let’s check your dental health',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColors.SecondaryColor,
                              fontFamily: 'Montserrat',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 16.0,
                      ),
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/photos/onBording.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: searchBar(
                      items: items,
                    )),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Recent (${items.length})",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return HomeCard(
                        Card_item: item,
                        List_index: index,
                        imageVailed: item.IsimageVailed,
                      );
                    },
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.Primary_color,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GuidPage()),
                );
              },
              shape: CircleBorder(
                side: BorderSide(color: AppColors.Primary_color, width: 2.w),
              ),
              child: const Image(
                  image: AssetImage("assets/images/icons/scan.png")),
            ),
          )
        : Scaffold(
            resizeToAvoidBottomInset: true,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 45.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            'Welcome, Islam',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColors.dark_text,
                              fontFamily: 'Montserrat',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            'Let’s check your dental health',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColors.SecondaryColor,
                              fontFamily: 'Montserrat',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 16.0,
                      ),
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/photos/onBording.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: searchBar(
                      items: items,
                    )),
                const Spacer(),
                Image(
                  image: const AssetImage("assets/images/photos/Frame.png"),
                  width: 280.w,
                  height: 250.h,
                ),
                SizedBox(
                  height: 10.h,
                ),

                Text(
                  "Let's Get Started with Your Smile Journey",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.dark_text),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Smile Analysis with AI! Get insights for a\n confident you",
                  textAlign: TextAlign.center,
                  softWrap: false,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.SecondaryColor),
                ),
                // SizedBox(
                //   height: 50.h,
                // ),
                const Spacer(),
                BtnWidget(
                  btnText: "Start Smile Analysis",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GuidPage()),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          );
  }
}
