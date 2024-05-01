// ignore_for_file: file_names, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/HomeCard.dart';
import 'package:ortho/models/dataOfScan.dart';
import 'package:ortho/screens/Guid_page.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedFilter = 'All'; // Added variable to store selected filter

  static const List<String> list = <String>[
    'All',
    'Curved',
    'Date',
    'Num Of Scan'
  ];
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
    return Scaffold(
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
                        color: AppColors.SubHeadText,
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
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.searchbar_background,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(16),
                ),
                border: Border.all(
                  color: AppColors.searchbar_background,
                  width: 1.w,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: AppColors.searchbar_text,
                          fontFamily: "Nunito",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        icon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  Image(
                    width: 12.w,
                    height: 12.h,
                    image: const AssetImage("assets/images/icons/Filter.png"),
                  ),
                  Text(
                    _selectedFilter,
                    style: TextStyle(
                      color: AppColors.searchbar_text,
                      fontFamily: "Nunito",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ), // Display selected filter
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                    onSelected: (value) {
                      setState(() {
                        _selectedFilter = value; // Update selected filter
                      });
                    },
                    itemBuilder: (BuildContext context) {
                      return list.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: items.isNotEmpty
                      ? Text(
                          "Recent (${items.length})",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : SizedBox(
                          height: 30.h,
                        )),
            ],
          ),
          items.isNotEmpty
              ? Expanded(
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
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image:
                            const AssetImage("assets/images/photos/Frame.png"),
                        width: 280.w,
                        height: 280.h,
                      ),
                      SizedBox(
                        height: 27.h,
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
                            color: AppColors.SubHeadText),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      BtnWidget(
                        btnText: "Start Smile Analysis",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GuidPage()),
                          );
                        },
                      )
                    ],
                  ),
                )
        ],
      ),
      floatingActionButton: items
              .isNotEmpty // Show FloatingActionButton only if items are not empty
          ? FloatingActionButton(
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
            )
          : null, // If items are empty, don't show FloatingActionButton
    );
  }
}
