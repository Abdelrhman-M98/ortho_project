// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/HomeCard.dart';
import 'package:ortho/components/Search_Bar.dart';
import 'package:ortho/components/imageProfile.dart';
import 'package:ortho/screens/Home/HomeStateNotifier.dart';
import 'package:ortho/screens/UserGuid/Guid_page.dart';

class HomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeProviderNotifier = ref.watch(HomeProvider.notifier);
    final HomeProviderState = ref.watch(HomeProvider);

    return Scaffold(
      body: RefreshIndicator(
        color: AppColors.Primary_color,
        onRefresh: () async {
          // ignore: await_only_futures
          HomeProviderNotifier.home();
        },
        child: HomeProviderState.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.Primary_color,
                ),
              )
            : HomeProviderState.data != null &&
                    HomeProviderState.data!.recentScans.isNotEmpty
                ? Scaffold(
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 45.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                  ),
                                  child: Text(
                                    'Welcome, ${HomeProviderState.data!.user.name}',
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColors.dark_text,
                                      fontFamily: 'Montserrat',
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                  ),
                                  child: Text(
                                    'Let’s check your dental health',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: AppColors.SecondaryColor,
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 16.0,
                              ),
                              child: UploadImage(
                                radius: 25.sp,
                                isVisiable: false,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: searchBar(),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                              ),
                              child: Text(
                                "Recent (${HomeProviderState.data!.recentScans.length})",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                HomeProviderState.data!.recentScans.length,
                            itemBuilder: (context, index) {
                              final item =
                                  HomeProviderState.data!.recentScans[index];
                              return HomeCard(
                                  analysisData: HomeProviderState
                                      .data!.recentScans[index]);
                            },
                          ),
                        )
                      ],
                    ),
                    floatingActionButton: FloatingActionButton(
                      backgroundColor: AppColors.Primary_color,
                      onPressed: () {
                        Route route = MaterialPageRoute(
                          builder: (context) => const GuidPage(),
                        );
                        Navigator.push(context, route);
                      },
                      shape: CircleBorder(
                        side: BorderSide(
                          color: AppColors.Primary_color,
                          width: 2.w,
                        ),
                      ),
                      child: const Image(
                        image: AssetImage(
                          "assets/images/icons/Scan.png",
                        ),
                      ),
                    ),
                  )
                : Scaffold(
                    resizeToAvoidBottomInset: true,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 45.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                  ),
                                  child: IntrinsicWidth(
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minWidth: 150.w,
                                        maxWidth: 300.0,
                                        minHeight: 50.0,
                                        maxHeight: 150.0,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'Welcome, ${HomeProviderState.data!.user.name}',
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    'Let’s check your dental health',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: AppColors.SecondaryColor,
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 16.0,
                              ),
                              child: UploadImage(
                                radius: 20.sp,
                                isVisiable: false,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: searchBar()),
                        const Spacer(),
                        Image(
                          image: const AssetImage(
                              "assets/images/photos/Frame.png"),
                          width: 280.w,
                          height: 250.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Let's Get Started with Your Smile Journey",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.dark_text),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Smile Analysis with AI! Get insights for a\n confident you",
                          textAlign: TextAlign.center,
                          softWrap: false,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.SecondaryColor),
                        ),
                        const Spacer(),
                        BtnWidget(
                          btnText: "Start Smile Analysis",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GuidPage()),
                            );
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
