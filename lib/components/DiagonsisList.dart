// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/models/model_result/model_result.dart';

class DiagonsisList extends StatelessWidget {
  final ModelResult modelResult;
  DiagonsisList({
    super.key,
    required this.modelResult,
  });

  late bool isBinaryClassification = modelResult.classes!.length == 1;
  late int biggestIndex = modelResult.classes!
      .indexOf(modelResult.classes!.reduce((a, b) => a > b ? a : b));
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            top: 20.h,
          ),
          child: Text(
            modelResult.title!,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w500,
              color: AppColors.Head_Text,
              fontSize: 17.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            modelResult.description!,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w400,
              color: AppColors.FormHintsTextColor,
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: modelResult.classes!.length,
          itemBuilder: (context, index) {
            final isChosen = isBinaryClassification
                ? modelResult.classes![index] >= 0.5
                : index == biggestIndex;
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Theme(
                    data: ThemeData(
                      checkboxTheme: const CheckboxThemeData(
                        shape: CircleBorder(),
                      ),
                    ),
                    child: Checkbox(
                      value: isChosen,
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
                  modelResult.labels![index],
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: AppColors.Report_checkbox_Text,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
