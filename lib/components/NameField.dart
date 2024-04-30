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
  bool isValid = true;
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      focusNode: _nameFocusNode,
      autofocus: true,
      obscureText: false,
      decoration: InputDecoration(
        labelText: widget.fieldLabel,
        labelStyle: TextStyle(
          color: AppColors.FormNonFouceColor,
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
        hintText: _nameFocusNode.hasFocus ? '' : widget.fieldHint,
        hintStyle: TextStyle(
          color: _nameFocusNode.hasFocus
              ? AppColors.FormHintsTextColor
              : Colors.transparent,
          fontSize: 17.sp,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _nameFocusNode.hasFocus
                ? isValid
                    ? AppColors.Primary_color
                    : AppColors.Pin_error_color
                : AppColors.FormNonFouceColor,
            width: 0.8.w,
          ),
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(36),
            right: Radius.circular(36),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                isValid ? AppColors.Primary_color : AppColors.Pin_error_color,
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
        suffixIcon: _nameController.text.isNotEmpty
            ? isValid
                ? Image.asset(
                    "assets/images/icons/vailedName.png",
                    width: 16.w,
                    height: 16.h,
                  )
                : Image.asset(
                    "assets/images/icons/NotVailedName.png",
                    width: 16.w,
                    height: 16.h,
                  )
            : null,
      ),
      style: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
      onChanged: (value) {
        setState(() {
          isValid = value != 'tt';
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is required'; // Return error message when validation fails
        }
        return null;
      },
    );
  }
}
