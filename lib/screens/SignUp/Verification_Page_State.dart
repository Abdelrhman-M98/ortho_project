// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, file_names, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_With_loading_Sppiner.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/screens/Login/Login_page.dart';
import 'package:ortho/screens/SignUp/OtpNotifier.dart';
import 'package:pinput/pinput.dart'; // Import PinCodeTextField

class VerificationPage extends HookConsumerWidget {
  VerificationPage({
    super.key,
    required this.otpId,
  });
  final String otpId;

  final TextEditingController pinController = TextEditingController();
  bool isLoading = false;
  late Timer _timer;
  int _start = 60;
  bool isPinCorrect = false;
  final FocusNode _pinFocusNode = FocusNode();

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          useEffect(() {
            timer.cancel();
          });
        } else {
          useEffect(() {
            _start--;
          });
        }
      },
    );
  }

  void restartTimer() {
    useEffect(() {
      _start = 60;
      startTimer();
    });
  }

  void dispose() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpProviderNotifier = ref.watch(otpProvider.notifier);
    final otpProviderState = ref.watch(otpProvider);

    ref.listen(otpProvider, (previous, next) {
      if (next.isLoading) {
        return;
      }
      if (next.authState == AuthState.authenticated) {
        Route route = MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
        Navigator.pushReplacement(context, route);
      }
      if (next.authState == AuthState.failed) {
        isPinCorrect = false;
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        titleText: 'Back',
        onTap: () {
          Navigator.of(context).pop();
          // Handle onTap action if needed
        },
        barIcon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.Primary_color,
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
              color: AppColors.Head_Text,
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
                debugPrint(pin);
                otpProviderNotifier.otpVerify(otpId, pin);
                // Unfocus the pin input field after completion
                _pinFocusNode.unfocus();
                // Hide the keyboard
                SystemChannels.textInput.invokeMethod('TextInput.hide');
              },
              validator: (pin) {},
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
                      onTap: () {},
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 16.sp,
                          color: AppColors.Primary_color,
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
              child: Spinner_BTN(
                btnText: "Verify OTP",
                onTap: () {
                  otpProviderNotifier.otpVerify(otpId, pinController.text);
                },
                isLoading: otpProviderNotifier.state.isLoading,
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
