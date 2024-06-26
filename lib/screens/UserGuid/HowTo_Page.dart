// ignore_for_file: file_names, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/screens/UploadImage/Camera_Page.dart';
import 'package:ortho/screens/UserGuid/Guid_page.dart';

class GuidHowTo extends StatefulWidget {
  const GuidHowTo();

  @override
  State<GuidHowTo> createState() => _GuidHowToState();
}

class _GuidHowToState extends State<GuidHowTo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Back',
        onTap: () {
          Route route =
              MaterialPageRoute(builder: (context) => const GuidPage());
          Navigator.pushReplacement(context, route);
        },
        barIcon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.Primary_color,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Taking the perfect picture",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                  fontSize: 22.sp,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Follow these tips for capturing a great image:",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.SecondaryColor,
                ),
              ),
              SizedBox(
                height: 31.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage(
                        "assets/images/icons/Do_icon.png",
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Do's",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                        fontSize: 24.sp,
                        color: AppColors.Primary_color,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Image(
                      width: 48.w,
                      height: 48.h,
                      image: const AssetImage(
                        "assets/images/icons/Positioning.png",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Positioning",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: AppColors.dark_text,
                          ),
                        ),
                        Text(
                          softWrap: true,
                          "Make sure you're centered Capture from the collarbone up",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: AppColors.SecondaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Image(
                      width: 48.w,
                      height: 48.h,
                      image: const AssetImage(
                        "assets/images/icons/Lighting.png",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lighting",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: AppColors.dark_text,
                          ),
                        ),
                        Text(
                          softWrap: true,
                          "Avoid overhead or direct light Natural lighting is best",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: AppColors.SecondaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage(
                        "assets/images/icons/Doesn't_icon.png",
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Don'ts",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                        fontSize: 24.sp,
                        color: AppColors.Primary_color,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Image(
                      width: 48.w,
                      height: 48.h,
                      image: const AssetImage(
                        "assets/images/icons/Accessories.png",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Accessories",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: AppColors.dark_text,
                          ),
                        ),
                        Text(
                          softWrap: true,
                          "Glasses are not allowed Wear sunglasses or hats",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: AppColors.SecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Image(
                      width: 48.w,
                      height: 48.h,
                      image: const AssetImage(
                        "assets/images/icons/Expression.png",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expression",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: AppColors.dark_text,
                          ),
                        ),
                        Text(
                          softWrap: true,
                          "Show your best smile – natural and relaxed! and Keep your teeth gently closed, don't force it.",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: AppColors.SecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              BtnWidget(
                btnText: "Start Scan",
                onTap: () async {
                  Route route = MaterialPageRoute(
                      builder: (context) => const CameraScreen());
                  Navigator.pushReplacement(context, route);
                },
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
