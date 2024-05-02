// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class NameField extends StatefulWidget {
  const NameField({
    required this.fieldLabel,
  });

  final String fieldLabel;

  @override
  NameFieldState createState() => NameFieldState();
}

class NameFieldState extends State<NameField> {
  final formNameKey = GlobalKey<FormState>();
  GlobalKey<FormState> getFormKey() => formNameKey;
  bool isFocused = false;
  bool isValid = true;
  bool isValidName = true;
  bool isTyping = false; // Track whether the user is typing
  final TextEditingController nameController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();

  // Dummy list of names
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
    nameFocusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    setState(() {
      isFocused = nameFocusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    nameFocusNode.removeListener(_onFocusChanged);
    nameController.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formNameKey,
      controller: nameController,
      focusNode: nameFocusNode,
      autofocus: false,
      obscureText: false,
      decoration: InputDecoration(
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
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(36),
            right: Radius.circular(36),
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
        suffixIcon: nameController.text.isNotEmpty
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
          if (nameController.text.isEmpty) {
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
