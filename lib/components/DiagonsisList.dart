// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/models/Diagnosis.dart';

class DiagonsisList extends StatelessWidget {
  final List<Diagnosis> categories;
  final List<Diagnosis> diagnosis;

  const DiagonsisList({
    super.key,
    required this.categories,
    required this.diagnosis,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < categories.length; i++) ..._buildCategoryWidgets(i),
      ],
    );
  }

  List<Widget> _buildCategoryWidgets(int index) {
    final category = categories[index];
    final categoryKey = category.name;
    final subcategories = category.subcategories;

    return [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          'No.${index + 1} - $categoryKey',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w500,
            color: AppColors.Report_Head_Text,
            fontSize: 23.sp,
          ),
        ),
      ),
      for (int j = 0; j < subcategories.length; j++)
        _buildSubcategoryWidget(subcategories[j]),
    ];
  }

  Widget _buildSubcategoryWidget(String subcategory) {
    // Check if the subcategory exists in both lists
    bool isChecked =
        diagnosis.any((diag) => diag.subcategories.contains(subcategory));

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Theme(
            data: ThemeData(
              checkboxTheme: const CheckboxThemeData(
                shape: CircleBorder(),
              ),
            ),
            child: Checkbox(
              value: isChecked,
              onChanged: (value) {
                // Handle checkbox value change here
              },
              side: BorderSide(
                width: 2.w,
                color: AppColors.Report_checkbox_Text,
              ),
              activeColor: AppColors.Primary_color,
              checkColor: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          subcategory,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w400,
            color: AppColors.Report_checkbox_Text,
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }
}
