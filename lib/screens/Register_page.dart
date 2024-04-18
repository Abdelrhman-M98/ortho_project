import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/screens/Virification_Page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key});
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/Custom_Text_Form_Field.dart';
import 'package:ortho/screens/Login_page.dart';
import 'package:ortho/screens/Virification_Page.dart'; // Fixed import statement

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    super.key,
  });
>>>>>>> 8abd388de96dbdc767ca057c6333557bd1185ee1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
<<<<<<< HEAD
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Login',
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {},
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          Text(
            "Hi there, welcome to Ortho AI ",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 28.sp,
              color: Color(0xff15331b),
            ),
          ),
          Text(
            "creating your account will take only few minutes to ensure to you a better experience ",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.normal,
              fontSize: 20.sp,
              color: Color(0xffa0cca9),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Sama Hany mo',
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(400),
                    bottomRight: Radius.circular(510),
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(510),
                  ),
=======
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 20,
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
>>>>>>> 8abd388de96dbdc767ca057c6333557bd1185ee1
                ),
              ),
            ),
          ),
<<<<<<< HEAD
          SizedBox(height: 15.h),
          TextField(
            decoration: InputDecoration(
              hintText: 'Email address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(510),
                  bottomRight: Radius.circular(510),
                  topLeft: Radius.circular(510),
                  topRight: Radius.circular(510),
                ),
                borderSide: BorderSide(color: Color(0xff60aa6f)),
              ),
            ),
          ),
          SizedBox(height: 80.h),
          BtnWidget(
            btnText: "Get started",
=======
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
      body: Column(
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
                color: AppColors.SubHeadText,
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomFormField(
                fieldHint: "User Name",
                fieldLabel: "User Name",
              )),
          SizedBox(
            height: 15.h,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomFormField(
                fieldHint: "Email address",
                fieldLabel: "Email address",
              )),
          const Spacer(),
          BtnWidget(
            btnText: "Continue",
>>>>>>> 8abd388de96dbdc767ca057c6333557bd1185ee1
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
<<<<<<< HEAD
=======
          SizedBox(
            height: 20.h,
          ),
>>>>>>> 8abd388de96dbdc767ca057c6333557bd1185ee1
        ],
      ),
    );
  }
}
