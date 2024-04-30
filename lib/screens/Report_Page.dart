// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/DiagonsisList.dart';
import 'package:ortho/screens/Home_Page.dart';

import '../components/ReportCard.dart';
import '../models/Diagnosis.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  List<Diagnosis> diagnosisList = [
    Diagnosis('Tooth Type', ['Tapering', 'Ovoid', 'Square']),
    Diagnosis('Smile Curve', ['Convex', 'Reverse']),
    Diagnosis('White Tooth Color', ['B1', 'B2', 'B3']),
  ];
  List<Diagnosis> realDiagnosisList = [
    Diagnosis('Tooth Type', ['Square']),
    Diagnosis('Smile Curve', ['Reverse']),
    Diagnosis('White Tooth Color', ['B1']),
  ];

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
              padding: const EdgeInsets.only(right: 16.0),
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
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  'Before ',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark_text,
                    fontSize: 16.sp,
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                Text(
                  'After ',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark_text,
                    fontSize: 16.sp,
                  ),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            const ReportCard(
              beforeImage: 'assets/images/photos/uploaded.jpg',
              afterImage: 'assets/images/photos/uploaded.jpg',
            ),
            SizedBox(height: 20.h),
            DiagonsisList(
              categories: diagnosisList,
              diagnosis: realDiagnosisList,
            ),
            BtnWidget(
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
            SizedBox(
              height: 10.h,
            ),
            TextButton(
              onPressed: () {
                // Add functionality for TextButton here
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const HomePage();
                      },
                    ),
                  );
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
            ),
          ],
        ),
      ),
    );
  }
}
