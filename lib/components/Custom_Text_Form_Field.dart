// ignore: file_names
// ignore_for_file: use_key_in_widget_constructors, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class CustomFormField extends StatelessWidget implements PreferredSizeWidget {
  const CustomFormField({
    required this.fieldHint,
    required this.fieldLabel,
  });

  final String fieldHint, fieldLabel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: _model.textController1,
      // focusNode: _model.textFieldFocusNode1,
      autofocus: true,
      obscureText: false,
      decoration: InputDecoration(
        labelText: fieldLabel,
        labelStyle: TextStyle(
          color: AppColors.FormHintsTextColor,
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
        hintText: fieldHint,
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
            color: AppColors.FormFouceColor,
            width: 1.1.w,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(36),
            topLeft: Radius.circular(8),
            topRight: Radius.circular(36),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.Pin_error_color,
            width: 2,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(36),
            topLeft: Radius.circular(8),
            topRight: Radius.circular(36),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.Pin_error_color,
            width: 2,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(80),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(80),
          ),
        ),
      ),
      style: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
      //validator: _model.textController1Validator.asValidator(context),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
