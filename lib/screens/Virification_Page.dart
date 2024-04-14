// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/screens/Login_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart'; // Import PinCodeTextField

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key});

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PinCodeTextField(
                appContext: context,
                length: 5,
                textStyle: const TextStyle(
                  fontFamily: 'Nunito',
                  color: AppColors.Pin_Text,
                  fontSize: 26,
                  letterSpacing: 0,
                  height: 1.2,
                ),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                enableActiveFill: false,
                autoFocus: true,
                enablePinAutofill: true,
                errorTextSpace: 16,
                showCursor: false,
                cursorColor: AppColors.cursorColor,
                obscureText: false,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  fieldHeight: 67,
                  fieldWidth: 50,
                  borderWidth: 1.33,
                  borderRadius: BorderRadius.circular(72),
                  shape: PinCodeFieldShape.box,
                  activeColor: AppColors.Pin_full_color,
                  inactiveColor: AppColors.Pin_Empty_color,
                  selectedColor: AppColors.Pin_full_color,
                  selectedFillColor: AppColors.Pin_full_color,
                ),
                onChanged: (value) {
                  if (value == '12345') {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (_) {
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "resend verification code  (0:55) ",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom > 0 ? 225 : 352,
            ),
            SizedBox(
              width: 360,
              height: 60,
              child: BtnWidget(
                btnText: "Verify OTP",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
