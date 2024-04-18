import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/screens/Virification_Page.dart';

class Upload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.btn_background,
            ),
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            color:AppColors.btn_background,
            onPressed: () {
              // Add functionality to navigate back here
            },
          ),
        ),
        title: Text(
          "Upload Picture",
          style: TextStyle(
            color: AppColors.btn_background,
            fontSize: 15.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ), // Adjust the right padding as needed
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                "Our AI engine will analyze your picture and give you personalized insights based on the input",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15.sp,
                ),
                softWrap: true, // Enable wrapping
                maxLines: 2, // Set maximum lines
              ),

              SizedBox(height: 30.h),
              Center(
                child: Container(
                  height: 450.h,
                  width: 700.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white, // Border color
                      // Border width
                    ),
                    borderRadius: BorderRadius.circular(10.0), // Border radius
                  ),
                  child: Image(
                    image: const AssetImage(
                        "assets/images/photos/uploaded.jpg"), //assets/images/icons/ortho_Logo.png
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Image uploaded successfully. Please click on Save & Continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Color(0xff358044),
                ),
              ),

              SizedBox(height: 50.h), // Add spacing between text and button
              BtnWidget(
                // Add BtnWidget here
                btnText: "Save & Continue",
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
        ),
      ),
    );
  }
}
