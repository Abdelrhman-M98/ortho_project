// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class EmailField extends StatefulWidget implements PreferredSizeWidget {
  const EmailField({
    required this.fieldLabel,
  });

  final String fieldLabel;

  @override
  _EmailFieldState createState() => _EmailFieldState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _EmailFieldState extends State<EmailField> {
  final formEmailKey = GlobalKey<FormState>();
  GlobalKey<FormState> getFormKey() => formEmailKey;
  bool isFocused = false;
  bool isValid = true;
  bool isTyping = false; // Track whether the user is typing
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: emailFocusNode,
      autofocus: false,
      obscureText: false,
      decoration: InputDecoration(
        //floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: !emailFocusNode.hasFocus
            ? emailController.text.isNotEmpty
                ? ''
                : widget.fieldLabel
            : widget.fieldLabel,
        labelStyle: TextStyle(
          color: emailFocusNode.hasFocus || isTyping
              ? isValid
                  ? AppColors.Primary_color // When focused/typing and valid
                  : AppColors.Fail_Text // When focused/typing and not valid
              : AppColors.FormNonFouceColor, // When not focused and not typing
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isFocused || isTyping
                ? isValid
                    ? AppColors.Primary_color // When focused/typing and valid
                    : AppColors.Fail_Text // When focused/typing and not valid
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
      ),
      style: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
    );
  }
}
