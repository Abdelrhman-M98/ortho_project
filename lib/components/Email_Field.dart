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
  bool isValidName = true;
  bool isTyping = false;
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();

  List<String> nameList = [
    'John',
    'Alice',
    'Bob',
    'Charlie',
    'Eva',
  ];

  @override
  void initState() {
    super.initState();
    emailController.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    setState(() {
      isFocused = emailFocusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    emailFocusNode.removeListener(_onFocusChanged);
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formEmailKey,
      controller: emailController, 
      focusNode: emailFocusNode,
      autofocus: false,
      obscureText: false,
      decoration: InputDecoration(
        //floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: widget.fieldLabel,
        labelStyle: TextStyle(
          color: isFocused
              ? isValidName
                  ? AppColors.Primary_color // When focused/typing and valid
                  : AppColors.Fail_Text // When focused/typing and not valid
              : AppColors.FormNonFouceColor, // When not focused and not typing
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.FormNonFouceColor,
            width: 0.8.w,
          ),
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(36),
            right: Radius.circular(36),
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
      onChanged: (value) {
        setState(() {
          isTyping = true; // User is typing
          isValid = value.trim().isNotEmpty;
          // Check if the written text is similar to any name in the list
          if (nameList.contains(value.trim())) {
            isValid = false;
          }
        });
      },
      onTap: () {
        setState(() {
          isFocused = true;
        });
      },
      onEditingComplete: () {
        setState(() {
          // Reset typing state when editing is complete
          if (emailController.text.isEmpty) {
            isValid = true;
          }
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            isValidName = false;
          });
          return 'Must Fill The Name Field'; // Return error message when validation fails
        } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
          setState(() {
            isValidName = false;
          });
          return 'The name Shoulb be [a-z A-Z]';
        } else if (nameList.contains(value.trim())) {
          setState(() {
            isValidName = false;
          });
          return 'This Name is used Before';
        } else {
          setState(() {
            isValidName = true;
          });

          return null;
        }
      },
    );
  }
}
