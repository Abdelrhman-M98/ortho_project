// ignore_for_file: file_names, non_constant_identifier_names, use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/models/dataOfScan.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    required this.beforeImage,
    /*required this.afterImage*/
  });
  final String beforeImage;
  //final String afterImage;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card_background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      elevation: 4,
      margin: const EdgeInsets.all(
        8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 227.h,
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
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.network(
                beforeImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
