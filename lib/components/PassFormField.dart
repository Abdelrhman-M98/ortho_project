// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class PasswordField extends StatelessWidget implements PreferredSizeWidget {
  const PasswordField({
    required this.fieldHint,
    required this.fieldLabel,
  });

  final String fieldHint, fieldLabel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // Field to input password
      obscureText: true, // Hide or show password text
      decoration: InputDecoration(
        hintText: "Password",
        labelText: "Password",
        labelStyle: TextStyle(
          color: AppColors.FormHintsTextColor,
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          fontSize: 17.sp,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.FormNonFouceColor,
            width: 0.8.w,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(36),
            topLeft: Radius.circular(8),
            topRight: Radius.circular(36),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.Primary_color,
            width: 1.1.w,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(36),
            topLeft: Radius.circular(8),
            topRight: Radius.circular(36),
          ),
        ),
      ),
      style: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
