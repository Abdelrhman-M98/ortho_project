// ignore_for_file: use_super_parameters, library_private_types_in_public_api, file_names, unnecessary_import, non_constant_identifier_names, prefer_final_fields, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/screens/Report_Page.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  int _IsVailed = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.Primary_color,
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              color: AppColors.Primary_color,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        title: Text(
          "Upload Picture",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w400,
            color: AppColors.Primary_color,
            fontSize: 16.sp,
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
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
                softWrap: true, // Enable wrapping
                maxLines: 2, // Set maximum lines
              ),

              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Container(
                  height: 450.h,
                  width: 700.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(2, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: const Image(
                      image: AssetImage(
                        "assets/images/photos/uploaded.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),

              Visibility(
                visible: _IsVailed != 0, // Check if _IsVailed is not equal to 0
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Handle onTap action if needed
                        },
                        child: Container(
                          child: Text(
                            "Image uploaded successfully. Please click on \nSave & Continue",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: AppColors.Verified_Text,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                    ),
                    const Image(
                      image: AssetImage(
                        "assets/images/icons/vailed.jpg",
                      ),
                    ),
                  ],
                ),
              ),

              Visibility(
                visible: _IsVailed == 0, // Check if _IsVailed is not equal to 0
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Handle onTap action if needed
                        },
                        child: Text(
                          "Image capture unsuccessful. Please retake the \nimage",
                          textAlign: TextAlign.start,
                          softWrap: false,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.Fail_Text,
                          ),
                        ),
                      ),
                    ),
                    const Image(
                      image: AssetImage(
                        "assets/images/icons/notVailed.jpg",
                      ),
                    ),
                  ],
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
                        return const ReportPage();
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
