// ignore_for_file: file_names, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/components/InputField.dart';
import 'package:ortho/screens/ResetPassword/Verification_Reset_Pass_PageState.dart';

class ForgetPassPage extends HookWidget {
  const ForgetPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final emailController = useTextEditingController();
    late final formKey = useMemoized(() => GlobalKey<FormState>());

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              "Forgot Password ",
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
                color: AppColors.dark_text, // Change the color of the text
              ),
            ),
            SizedBox(height: 10.h), // Adjust the space between the texts
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                "No worries! Enter your email address below and we will send you a code to reset password.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.Pin_Empty_color,
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ), // Adjusted the height to 20.h
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: InputFeild(
                setErrorSate: false,
                showSuffixIcon: true,
                titel: 'Eamil Adderss',
                controller: emailController,
                validator: (value) {
                  return null;
                },
              ),
            ),
            const Spacer(),
            // Add space below the text
            BtnWidget(
              btnText: "Submit",
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const VerificationForgetPass();
                      },
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
