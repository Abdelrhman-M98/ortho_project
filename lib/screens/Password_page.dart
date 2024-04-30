// ignore_for_file: library_private_types_in_public_api, file_names, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/screens/Virification_Page.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  bool _isVisible = false;

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
          color: AppColors.Primary_color,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 12.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Make sure it’s 8 characters or more, it should be something others Couldn’t guess",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: AppColors.SubHeadText,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              // Field to input password
              obscureText: !_isVisible, // Hide or show password text
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password",
                labelStyle: TextStyle(
                  color: AppColors.FormHintsTextColor,
                  fontFamily: 'Nunito',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
                hintStyle: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.FormNonFouceColor,
                    width: 0.8.w,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(36),
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(36),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.Primary_color,
                    width: 1.1.w,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(36),
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(36),
                  ),
                ),
              ),
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Checkbox(
                  value: _isVisible,
                  onChanged: (value) {
                    setState(() {
                      _isVisible = value!;
                    });
                  },
                  side: BorderSide(
                    width: 2.w,
                    color: AppColors.Primary_color,
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.w,
                      color: AppColors.Primary_color,
                    ),
                    borderRadius: BorderRadius.circular(
                        4), // Adjust the border radius as needed
                  ),
                  activeColor: AppColors.Primary_color,
                  checkColor: Colors.white,
                ),
              ),
              Text(
                "Show password",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.SubHeadText,
                ),
              ),
            ],
          ),
          const Spacer(),
          BtnWidget(
            btnText: "Get OTP",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const VerificationPage();
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
    );
  }
}
