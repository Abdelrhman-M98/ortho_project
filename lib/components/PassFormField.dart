// ignore_for_file: use_key_in_widget_constructors, file_names, library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class PasswordField extends StatefulWidget implements PreferredSizeWidget {
  const PasswordField({
    required this.fieldHint,
    required this.fieldLabel,
  });

  final String fieldHint, fieldLabel;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _PasswordFieldState extends State<PasswordField> {
  final formPassKey = GlobalKey<FormState>();
  GlobalKey<FormState> getFormKey() => formPassKey;
  bool isFocused = false;
  bool isValid = true;
  bool isValidName = true;
  bool isTyping = false; // Track whether the user is typing
  final TextEditingController PassController = TextEditingController();
  final FocusNode PassFocusNode = FocusNode();

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
    PassFocusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    setState(() {
      isFocused = PassFocusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    PassFocusNode.removeListener(_onFocusChanged);
    PassController.dispose();
    PassFocusNode.dispose();
    super.dispose();
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.fieldHint,
        labelText: widget.fieldLabel,
        labelStyle: TextStyle(
          color: isFocused
              ? isValidName
                  ? AppColors.Primary_color
                  : AppColors.Fail_Text
              : AppColors.FormNonFouceColor,
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
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: _obscureText ? Colors.grey : AppColors.Primary_color,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
      style: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 20.sp,
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
          if (PassController.text.isEmpty) {
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
