// ignore_for_file: file_names, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/Custom_Text_Form_Field.dart';
import 'package:ortho/screens/verify_reset_Page.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        titleSpacing: -10, // Adjust the title spacing to reduce space
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.Primary_color,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Back',
          style: TextStyle(
            color: AppColors.Primary_color,
          ),
        ),
        // backgroundColor: Colors.white, // Change the background color of AppBar
      ),
      body: Column(
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
          SizedBox(height: 20.h), // Adjusted the height to 20.h
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CustomFormField(
              fieldHint: "Email address",
              fieldLabel: "Email address",
            ),
          ),
          const Spacer(),
          // Add space below the text
          BtnWidget(
            btnText: "Submit",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const VerificationForgetPass();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
