// ignore: file_names
// ignore_for_file: use_key_in_widget_constructors, file_names, duplicate_ignore, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class NameField extends StatefulWidget {
  const NameField({
    required this.fieldHint,
    required this.fieldLabel,
  });

  final String fieldHint, fieldLabel;

  @override
  _NameFieldState createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  bool isValeid = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: _model.textController1,
      // focusNode: _model.textFieldFocusNode1,
      autofocus: true,
      obscureText: false,
      decoration: InputDecoration(
        labelText: widget.fieldLabel,
        labelStyle: TextStyle(
          color: AppColors.FormHintsTextColor,
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
        hintText: widget.fieldHint,
        hintStyle: TextStyle(
          fontSize: 17.sp,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isValeid
                ? AppColors.Primary_color
                : AppColors.FormNonFouceColor,
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
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.Pin_error_color,
            width: 2,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(36),
            topLeft: Radius.circular(8),
            topRight: Radius.circular(36),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.Pin_error_color,
            width: 2,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(80),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(80),
          ),
        ),
        suffixIcon: isValeid
            ? Image(
                width: 16.w,
                height: 16.h,
                image: const AssetImage(
                  "assets/images/icons/vailedName.png",
                ),
              )
            : Image(
                width: 16.w,
                height: 16.h,
                image: const AssetImage(
                  "assets/images/icons/NotVailedName.png",
                ),
              ),
      ),
      style: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
      onChanged: (value) {
        setState(() {
          isValeid = value == 'tt';
        });
      },
      validator: (value) {
        value = null;
        return null;
      },
      //validator: _model.textController1Validator.asValidator(context),
    );
  }
}
