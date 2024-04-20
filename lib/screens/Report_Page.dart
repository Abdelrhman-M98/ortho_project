// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  bool _isVisible1 = false;
  bool _isVisible2 = false;
  bool _isVisible3 = false;
  bool _isVisible4 = false;
  bool _isVisible5 = false;
  bool _isVisible6 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scan#1 Report",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w400,
            color: AppColors.Primary_color,
            fontSize: 16.sp,
          ),
        ),
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 16.0,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/icons/Send_colord.png",
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50.h),
                Text(
                  'Before ',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark_text,
                    fontSize: 16.sp,
                  ),
                ),
                const SizedBox(width: 150),
                Text(
                  'After ',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark_text,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 1.h),
                  Container(
                    height: 290.h,
                    width: 360.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: const Image(
                        image: AssetImage(
                          "assets/images/photos/uploaded.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'No.01 - Tooth Type',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                            color: AppColors.Pin_Text,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'your tooth belongs to ',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark_text,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Theme(
                    data: ThemeData(
                      checkboxTheme: const CheckboxThemeData(
                        shape: CircleBorder(),
                      ),
                    ),
                    child: Checkbox(
                      value: _isVisible1,
                      onChanged: (value) {
                        setState(() {
                          _isVisible1 = value!;
                        });
                      },
                      side: BorderSide(
                        width: 2.w,
                        color: AppColors.dark_text,
                      ),
                      activeColor: AppColors.Primary_color,
                      checkColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 1.0),
                Text(
                  'Tapering',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark_text,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Theme(
                    data: ThemeData(
                      checkboxTheme: const CheckboxThemeData(
                        shape: CircleBorder(),
                      ),
                    ),
                    child: Checkbox(
                      value: _isVisible2,
                      onChanged: (value) {
                        setState(() {
                          _isVisible2 = value!;
                        });
                      },
                      side: BorderSide(
                        width: 2.w,
                        color: AppColors.dark_text,
                      ),
                      activeColor: AppColors.Primary_color,
                      checkColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Oviod',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark_text,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Theme(
                    data: ThemeData(
                      checkboxTheme: const CheckboxThemeData(
                        shape: CircleBorder(),
                      ),
                    ),
                    child: Checkbox(
                      value: _isVisible3,
                      onChanged: (value) {
                        setState(() {
                          _isVisible3 = value!;
                        });
                      },
                      side: BorderSide(
                        width: 2.w,
                        color: AppColors.Primary_color,
                      ),
                      activeColor: AppColors.Primary_color,
                      checkColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 5.0),
                Text(
                  'Square',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: AppColors.Primary_color,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h), // Add space before 'No.02 - Smile Curve'
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.h), // Add space here
                Expanded(
                  // Expand the space to center-align the text
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'No.02 - Smile Curve',
                      textAlign: TextAlign.center, // Center the text
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                        color: AppColors.Pin_Text,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  'your tooth belongs to ',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark_text,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Theme(
                    data: ThemeData(
                      checkboxTheme: const CheckboxThemeData(
                        shape: CircleBorder(),
                      ),
                    ),
                    child: Checkbox(
                      value: _isVisible4,
                      onChanged: (value) {
                        setState(() {
                          _isVisible4 = value!;
                        });
                      },
                      side: BorderSide(
                        width: 2.w,
                        color: AppColors.dark_text,
                      ),
                      activeColor: AppColors.Primary_color,
                      checkColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Convex',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark_text,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Theme(
                    data: ThemeData(
                      checkboxTheme: const CheckboxThemeData(
                        shape: CircleBorder(),
                      ),
                    ),
                    child: Checkbox(
                      value: _isVisible5,
                      onChanged: (value) {
                        setState(() {
                          _isVisible5 = value!;
                        });
                      },
                      side: BorderSide(
                        width: 2.w,
                        color: AppColors.dark_text,
                      ),
                      activeColor: AppColors.Primary_color,
                      checkColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Reverse',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: AppColors.Primary_color,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Theme(
                    data: ThemeData(
                      checkboxTheme: const CheckboxThemeData(
                        shape: CircleBorder(),
                      ),
                    ),
                    child: Checkbox(
                      value: _isVisible6,
                      onChanged: (value) {
                        setState(() {
                          _isVisible6 = value!;
                        });
                      },
                      side: BorderSide(
                        width: 2.w,
                        color: AppColors.Primary_color,
                      ),
                      activeColor: AppColors.Primary_color,
                      checkColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  'Flat ',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: AppColors.Primary_color,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Center(
              child: BtnWidget(
                btnText: "Download full report",
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
            ),
            SizedBox(height: 10.h),
            TextButton(
              onPressed: () {
                // Add functionality for TextButton here
              },
              child: Text(
                "Back to the home",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w400,
                  color: AppColors.Primary_color,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
