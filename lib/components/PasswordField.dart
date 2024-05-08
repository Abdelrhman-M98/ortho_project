// ignore_for_file: implementation_imports, unnecessary_import, file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class PasswordFeild extends HookWidget {
  PasswordFeild({
    super.key,
    required this.titel,
    required this.controller,
    required this.validator,
    required this.showSuffixIcon,
    required this.obscureText,
    this.setErrorSate,
  });

  final String titel;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool showSuffixIcon;
  final bool obscureText;
  bool? setErrorSate;

  @override
  Widget build(BuildContext context) {
    final isFocused = useState(false);
    final isValid = useState(true);
    final obscureTextState = useState(obscureText);

    final inputFocusNode = useFocusNode();
    inputFocusNode.addListener(() {
      isFocused.value = inputFocusNode.hasFocus;
    });

    return TextFormField(
      controller: controller,
      focusNode: inputFocusNode,
      autofocus: false,
      obscureText: obscureTextState.value,
      decoration: InputDecoration(
        labelText: titel,
        labelStyle: TextStyle(
          color: setErrorSate == true
              ? AppColors.Fail_Text
              : isValid.value && isFocused.value
                  ? AppColors.Primary_color
                  : AppColors.FormNonFouceColor,
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: setErrorSate == true
                ? AppColors.Fail_Text
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
            color: setErrorSate == true
                ? AppColors.Fail_Text
                : AppColors.Primary_color,
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
        errorMaxLines: 2,
        errorStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontFamily: 'Nunito',
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.Pin_error_color,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 10.0,
          ),
          child: IconButton(
            icon: Icon(
              showSuffixIcon
                  ? obscureTextState.value
                      ? Icons.visibility_off
                      : Icons.visibility
                  : null,
              color: obscureTextState.value
                  ? AppColors.SecondaryColor
                  : AppColors.Primary_color,
            ),
            onPressed: () {
              obscureTextState.value = !obscureTextState.value;
            },
          ),
        ),
      ),
      style: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
      onTap: () {
        isFocused.value = true;
      },
      validator: (value) {
        isValid.value = validator(value) == null;
        return validator(value);
      },
    );
  }
}
