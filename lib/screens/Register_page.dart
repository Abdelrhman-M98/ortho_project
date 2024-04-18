import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/screens/Virification_Page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                ),
              ),
            ),
          ),
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
        ],
      ),
    );
  }
}
