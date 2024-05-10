// ignore_for_file: implementation_imports, unnecessary_import, file_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/screens/Login/Login_page.dart';
import 'package:ortho/screens/SignUp/SignUp_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    super.key,
  }); // Use 'Key?' instead of 'super.key'

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FocusScope(
          onFocusChange: (hasFocus) {
            if (hasFocus) {
              FocusScope.of(context).unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 36.h,
                ),
                Center(
                  child: Image(
                    image:
                        const AssetImage("assets/images/icons/ortho_Logo.png"),
                    height: 50.h,
                    width: 50.w,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                const Center(
                  child: Image(
                    image: AssetImage(
                      "assets/images/photos/onBording.png",
                    ),
                  ),
                ),
                SizedBox(
                  height: 36.h,
                ),
                Text(
                  "Welcome to Ortho AI",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                    fontSize: 28.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                  ),
                  child: Text(
                    "Revolutionize your smile assessment with Ortho ai. AI-powered insights, personalized for you. Start now!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                BtnWidget(
                  btnText: "Get started",
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('firstTime', false);
                    Route route = MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    );
                    Navigator.pushReplacement(context, route);
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  width: 360.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      GestureDetector(
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                            fontSize: 17.sp,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const LoginPage(); // Navigate to Upload page
                            },
                          ));
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
