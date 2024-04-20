import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/components/Custom_Text_Form_Field.dart';
import 'package:ortho/components/PassFormField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          titleText: 'Login',
          onTap: () {
            Navigator.of(context).pop();
          },
          barIcon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.Primary_color,
          ),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Discover confidence with AI-powered smile analysis and personalized improvement tips. ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.SubHeadText,
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomFormField(
                  fieldHint: "Email address",
                  fieldLabel: "Email address",
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: PasswordField(
                  fieldHint: "Password",
                  fieldLabel: "Password",
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              BtnWidget(
                btnText: "Login",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const LoginPage();
                    },
                  ));
                },
              ),
              SizedBox(
                width: 360.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    GestureDetector(
                      child: Text(
                        "Sign up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.Primary_color,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const LoginPage();
                          },
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
