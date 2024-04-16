// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, file_names

import 'dart:async';
import 'package:flutter/material.dart';
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
  int _start = 3;
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
      resizeToAvoidBottomInset: false,
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
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Check verification code ",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 27,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "Enter the verification code we sent to your email",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: Pinput(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                errorTextStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Nunito",
                    color: AppColors.Pin_error_color),
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 67,
                  textStyle: const TextStyle(
                      fontSize: 26,
                      color: AppColors.dark_text,
                      fontWeight: FontWeight.w500),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.Pin_Empty_color),
                    borderRadius: BorderRadius.circular(72),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 50,
                  height: 67,
                  textStyle: const TextStyle(
                      fontSize: 26,
                      color: AppColors.dark_text,
                      fontWeight: FontWeight.w500),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.Pin_full_color),
                    borderRadius: BorderRadius.circular(72),
                  ),
                ),
                errorPinTheme: PinTheme(
                  width: 50,
                  height: 67,
                  textStyle: const TextStyle(
                      fontSize: 26,
                      color: AppColors.dark_text,
                      fontWeight: FontWeight.w500),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.Pin_error_color),
                    borderRadius: BorderRadius.circular(72),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Resend verification code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                _start != 0
                    ? Text(
                        "(0: $_start)",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          restartTimer(); // Call restartTimer function
                        },
                        child: const Text(
                          "Resend",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 16,
                            color: AppColors.btn_background,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom > 0 ? 190 : 350,
            ),
            Center(
              child: SizedBox(
                width: 360,
                height: 60,
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
          ],
        ),
      ),
    );
  }
}
