// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class Spinner_BTN extends StatefulWidget {
  final String btnText;
  final Function()? onTap;
  final bool isLoading;

  const Spinner_BTN(
      {super.key,
      required this.btnText,
      required this.onTap,
      required this.isLoading});

  @override
  State<Spinner_BTN> createState() => _Spinner_BTNState();
}

class _Spinner_BTNState extends State<Spinner_BTN> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 60.h,
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.Primary_color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.btnText,
              style: TextStyle(
                color: AppColors.White,
                fontFamily: "Nunito",
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Visibility(
              child: widget.isLoading
                  ? Row(
                      children: [
                        SizedBox(
                          width: 45.w,
                        ),
                        const CircularProgressIndicator(
                          color: AppColors.White,
                        ),
                      ],
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
