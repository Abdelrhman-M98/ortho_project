// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/imageProfile.dart';
import 'package:ortho/screens/AccountDetails/Account_Details_Page.dart';
import 'package:ortho/screens/Login/Login_page.dart';
import 'package:ortho/screens/Profile/ProfileNotifier.dart';
import 'package:ortho/shared/networking/networking.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserProviderNotifier = ref.watch(UserProvider.notifier);
    final UserProviderState = ref.watch(UserProvider);
    return Scaffold(
      body: UserProviderState.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.Primary_color,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45.h,
                  ),
                  Center(
                    child: Text(
                      "User Profile",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w600,
                        color: AppColors.dark_text,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Center(
                    child: UploadImage(
                      radius: 50.sp,
                      isVisiable: false,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: IntrinsicWidth(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 150.w,
                          maxWidth: 300.w,
                          minHeight: 50.h,
                          maxHeight: 150.h,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "${UserProviderState.user?.name}",
                            style: TextStyle(
                              fontFamily: "Montesrrat",
                              fontWeight: FontWeight.w600,
                              color: AppColors.dark_text,
                              fontSize: 24.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    width: 351.w,
                    height: 111.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.Primary_color),
                        color: AppColors.Profile_Container_color),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 16,
                            left: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Personal details",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.Primary_color,
                                  fontSize: 18.sp,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AccDetailsPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.Primary_color,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 16,
                            left: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Change password",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.Primary_color,
                                  fontSize: 18.sp,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.Primary_color,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage(
                            "assets/images/icons/Send_empty.png",
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Share this app",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.w400,
                              color: AppColors.SecondaryColor),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.SecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Image(
                          image: AssetImage(
                            "assets/images/icons/star.png",
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Rate us on playstore",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.w400,
                              color: AppColors.SecondaryColor),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.SecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        await Networking.deleteCookies();

                        Route route = MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        );
                        Navigator.pushReplacement(context, route);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            child: Image(
                              image: AssetImage(
                                "assets/images/icons/logout.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Log Out",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w400,
                                color: AppColors.Fail_Text),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
