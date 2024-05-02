// ignore_for_file: file_names, use_key_in_widget_constructors, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/components/PassFormField.dart';
import 'package:ortho/screens/Login_page.dart';

class ResetPassPage extends StatelessWidget {
  const ResetPassPage();

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
          color: AppColors.Primary_color,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Text(
              "Reset Password",
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w800,
                fontSize: 22.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "the password should be different then the previous one ",
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: AppColors.SecondaryColor,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: PasswordField(
                fieldHint: "Password",
                fieldLabel: "Password",
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: PasswordField(
                fieldHint: "Confirm password",
                fieldLabel: "Confirm password",
              ),
            ),
            const Spacer(),
            BtnWidget(
              btnText: "Reset password",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const LoginPage();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
