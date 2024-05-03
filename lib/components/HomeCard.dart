// ignore_for_file: file_names, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/models/dataOfScan.dart';
import 'package:intl/intl.dart';
import 'package:ortho/screens/Report_Page.dart';

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
      required this.Card_item,
      required this.List_index,
      required this.imageVailed});

  final ListItem Card_item;
  final int List_index;
  final int imageVailed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card_background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: AppColors.SecondaryColor, // Set the border color here
          width: 0.5, // Set the border width here
        ),
      ),
      elevation: 4,
      margin: const EdgeInsets.all(
        8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 253.h, // Specify the height of the images
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 253.h,
                  width: 187.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), // Rounded border
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.0),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(10)),
                    child: Image.asset(
                      Card_item.beforeImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 0.5.w,
                ),
                Container(
                  height: 253.h,
                  width: 188.5.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Rounded border
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.0),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      Card_item.afterImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Text(
                    'Scan #${List_index + 1}',
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 5),
                  child: Row(
                    children: [
                      Visibility(
                        visible: imageVailed ==
                            1, // Check if _IsVailed is not equal to 0
                        child: const Image(
                          image: AssetImage(
                            "assets/images/icons/staus_of_the_Scan_completed.png",
                          ),
                        ),
                      ),
                      Visibility(
                        visible: imageVailed == 0,
                        child: const Image(
                          image: AssetImage(
                            "assets/images/icons/staus_of_the_Scan_failed.png",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 14.w,
                  height: 14.h,
                  child: const Image(
                    image: AssetImage('assets/images/icons/Time_Circle.png'),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  'Date: ${DateFormat('MMM d, y hh:mm a').format(Card_item.date_of_scan)}',
                  style: TextStyle(
                    color: AppColors.SecondaryColor,
                    fontFamily: "Nunito",
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Row(
              children: [
                GestureDetector(
                  child: Text(
                    "view scan details",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w500,
                      color: AppColors.Primary_color,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.Primary_color,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const ReportPage();
                        },
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14.sp,
                    color: AppColors.Primary_color,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const ReportPage();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
