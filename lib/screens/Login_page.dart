// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/components/InputField.dart';
import 'package:ortho/components/PasswordField.dart';
import 'package:ortho/components/Social_BTN.dart';
import 'package:ortho/screens/Forgot_Password_Page.dart';
import 'package:ortho/screens/SignUPPage.dart';
import 'package:ortho/screens/User_Home_Page.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
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
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
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
                      color: AppColors.SecondaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: InputFeild(
                    showSuffixIcon: true,
                    titel: 'Eamil Adderss',
                    controller: emailController,
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: PasswordFeild(
                    controller: passwordController,
                    obscureText: true,
                    showSuffixIcon: true,
                    titel: "Password",
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 27.h,
                ),
                BtnWidget(
                  btnText: "Login",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const UserHomePage();
                      },
                    ));
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
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
                            return SignUpPage();
                          },
                        ));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "If you",
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
                        "Forgot your Password?",
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
                            return const ForgetPassPage();
                          },
                        ));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 16.0,
                        ),
                        child: Divider(
                          thickness: 2,
                          color: AppColors.divider_color,
                          height: 24, // Adjust the height of the divider
                          indent: 8,
                          endIndent: 8,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      child: Text(
                        'Or Login With',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: AppColors.divider_color,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Divider(
                          thickness: 2,
                          color: AppColors.divider_color,
                          height: 24, // Adjust the height of the divider
                          indent: 8,
                          endIndent: 8,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                SocialBTN(
                  btnText: 'Login with Google',
                  onTap: () {},
                  BtnColor: AppColors.Google_Color,
                  BtnIcon: 'assets/images/icons/google_icon.png',
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
