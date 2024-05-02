// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/Email_Field.dart';
import 'package:ortho/components/NameField.dart';
import 'package:ortho/screens/Login_page.dart';
import 'package:ortho/screens/Password_page.dart';
import 'package:ortho/screens/TermOfPolicy/terms_of_use.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> formNameKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.close,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const LoginPage();
                    },
                  ),
                );
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark_text,
                ),
              ),
            ),
          ),
        ],
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: SafeArea(
            child: Image.asset(
              'assets/images/icons/ortho_Logo.png',
            ),
          ),
        ),
      ),
      body: Form(
        key: formNameKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hi there, welcome to Ortho AI ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                    fontSize: 20.sp,
                    color: const Color(0xff15331b),
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
                "creating your account will take only few minutes to ensure to you a better experience ",
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: NameField(
                fieldLabel: "User Name",
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: EmailField(
                fieldLabel: "Email address",
              ),
            ),
            const Spacer(
              flex: 50,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                ),
                child: TermsOfUse(),
              ),
            ),
            const Spacer(),
            BtnWidget(
              btnText: "Continue",
              onTap: () {
                if (formNameKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const PasswordPage();
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
