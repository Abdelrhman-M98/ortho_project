// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends HookWidget {
  const OtpWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final pinFocusNode = useFocusNode();

    return Pinput(
      controller: controller,
      showCursor: false,
      crossAxisAlignment: CrossAxisAlignment.center,
      length: 5,
      onCompleted: (pin) {
        if (pin == '12345') {
          return;
        }
        // Unfocus the pin input field after completion
        pinFocusNode.unfocus();
        // Hide the keyboard
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      validator: (pin) {
        if (pin == '12345') {
          return null;
        } else {
          return "error";
        }
      },
      submittedPinTheme: PinTheme(
        width: 50.w,
        height: 67.h,
        textStyle: TextStyle(
            fontSize: 26.sp,
            color: AppColors.dark_text,
            fontWeight: FontWeight.w500),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.Primary_color,
          ),
          borderRadius: BorderRadius.circular(72),
        ),
      ),
      defaultPinTheme: PinTheme(
        width: 50.w,
        height: 67.h,
        textStyle: TextStyle(
          fontSize: 26.sp,
          color: AppColors.dark_text,
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.Pin_Empty_color),
          borderRadius: BorderRadius.circular(72),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 50.w,
        height: 67.h,
        textStyle: TextStyle(
            fontSize: 26.sp,
            color: AppColors.dark_text,
            fontWeight: FontWeight.w500),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.Primary_color,
          ),
          borderRadius: BorderRadius.circular(72),
        ),
      ),
      errorPinTheme: PinTheme(
        width: 50.w,
        height: 67.h,
        textStyle: TextStyle(
            fontSize: 26.sp,
            color: AppColors.dark_text,
            fontWeight: FontWeight.w500),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.Pin_error_color,
          ),
          borderRadius: BorderRadius.circular(72),
        ),
      ),
      errorText:
          "The verification code that you entered is incorrect , Try again ",
      errorTextStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontFamily: "Nunito",
        color: AppColors.Pin_error_color,
      ),
    );
  }
}
