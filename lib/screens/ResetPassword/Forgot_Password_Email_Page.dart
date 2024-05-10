// ignore_for_file: file_names, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/components/InputField.dart';
import 'package:ortho/screens/Login/Login_page.dart';
import 'package:ortho/screens/ResetPassword/ResetStateNotifier.dart';

class ForgetPassPage extends HookConsumerWidget {
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final emailController = useTextEditingController();
    late final formKey = useMemoized(() => GlobalKey<FormState>());
    final resetProviderNotifier = ref.watch(resetProvider.notifier);
    final resetProviderState = ref.watch(resetProvider);

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) {
          Route route =
              MaterialPageRoute(builder: (context) => const LoginPage());
          Navigator.pushReplacement(context, route);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          titleText: 'Back',
          onTap: () {
            Route route =
                MaterialPageRoute(builder: (context) => const LoginPage());
            Navigator.pushReplacement(context, route);
          },
          barIcon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.Primary_color,
          ),
        ),
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Forgot Password ",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                  color: AppColors.dark_text, // Change the color of the text
                ),
              ),
              SizedBox(height: 10.h), // Adjust the space between the texts
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Text(
                  "No worries! Enter your email address below and we will send you a code to reset password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.Pin_Empty_color,
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ), // Adjusted the height to 20.h
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: InputFeild(
                  setErrorSate: resetProviderState.hasErrors == true,
                  showSuffixIcon: true,
                  titel: 'Eamil Adderss',
                  controller: emailController,
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              resetProviderState.hasErrors
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .end, // Align items horizontally to the end (right side)
                        children: [
                          SizedBox(
                            height: 30.0 * resetProviderState.errors.length,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: resetProviderState.errors.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  resetProviderState.errors[index],
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.Fail_Text,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),

              const Spacer(),
              // Add space below the text
              BtnWidget(
                btnText: "Submit",
                onTap: () {
                  // if (!resetProviderState.hasErrors) {
                  //   return;
                  // }

                  // if (formKey.currentState!.validate()) {
                  //   return;
                  // }
                  final email = emailController.text;
                  resetProviderNotifier.requestReset(email);
                  debugPrint(email);
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
