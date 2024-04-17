// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/screens/Login_page.dart';
import 'package:pinput/pinput.dart'; // Import PinCodeTextField

class VerificationPage extends StatefulWidget {
  const VerificationPage();

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late Timer _timer;
  int _start = 60;
  bool isPinCorrect = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
// Set _resnd to 0 when countdown reaches zero
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void restartTimer() {
    setState(() {
      _start = 60;
      startTimer();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        titleText: 'Back', // Pass the title text here
        onTap: () {
          Navigator.of(context).pop();
          // Handle onTap action if needed
        },
        barIcon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.btn_background,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60.h,
          ),
          Text(
            "Check verification code ",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 27.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Text(
            "Enter the verification code we sent to your email",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Center(
            child: Pinput(
              showCursor: false,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              length: 5,
              onCompleted: (pin) {
                if (pin == '12345') {
                  isPinCorrect = true;
                  return;
                }
              },
              validator: (pin) {
                if (pin == '12345') {
                  return null;
                } else {
                  return "error";
                }
              },
              errorText:
                  "The verification code that you entered is incorrect , Try again ",
              errorTextStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Nunito",
                color: AppColors.Pin_error_color,
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
                  border: Border.all(color: AppColors.Pin_full_color),
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
                  border: Border.all(color: AppColors.Pin_error_color),
                  borderRadius: BorderRadius.circular(72),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Resend verification code",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              _start != 0
                  ? Text(
                      "(0: $_start)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        restartTimer(); // Call restartTimer function
                      },
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 16.sp,
                          color: AppColors.btn_background,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ],
          ),
          const Spacer(),
          Center(
            child: SizedBox(
              width: 360.w,
              height: 60.h,
              child: BtnWidget(
                btnText: "Verify OTP",
                onTap: () {
                  if (isPinCorrect == true) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
