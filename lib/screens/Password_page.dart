// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/components/PasswordField.dart';
import 'package:ortho/screens/Verification_Page_State.dart';

class PasswordPage extends HookWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        titleText: 'Back',
        onTap: () {
          Navigator.of(context).pop();
        },
        barIcon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.Primary_color,
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose a password",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                    fontSize: 20.sp,
                    color: AppColors.Head_Text,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Make sure it’s 8 characters or more, it should be something others Couldn’t guess",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.SecondaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: PasswordFeild(
                titel: "Password",
                controller: passwordController,
                validator: (value) {
                  return null;
                },
                showSuffixIcon: true,
                obscureText: false,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: PasswordFeild(
                titel: "Confirm Password",
                controller: confirmPasswordController,
                validator: (value) {
                  return null;
                },
                showSuffixIcon: true,
                obscureText: false,
              ),
            ),
            const Spacer(),
            BtnWidget(
              btnText: "Get OTP",
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const VerificationPage();
                      },
                    ),
                  );
                }
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
