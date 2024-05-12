// ignore_for_file: file_names, use_key_in_widget_constructors, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/components/PasswordField.dart';
import 'package:ortho/screens/Login/Login_page.dart';
import 'package:ortho/screens/ResetPassword/ResetPassNotifier.dart';

class ResetPassPage extends HookConsumerWidget {
  const ResetPassPage({
    required this.token,
  });
  final String token;

  Widget build(BuildContext context, WidgetRef ref) {
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final resetProviderNotifier = ref.watch(resetPassProvider(token).notifier);
    final resetProviderState = ref.watch(resetPassProvider(token));

    late final formKey = useMemoized(() => GlobalKey<FormState>());

    ref.listen(resetPassProvider(token), (previous, next) {
      if (next.isLoading) {
        return;
      }
      if (next.authState == ResetPassState.ok) {
        Route route = MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
        Navigator.pushReplacement(context, route);
      }
      if (next.authState == ResetPassState.failed) {}
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        titleText: 'Back', // Pass the title text here
        onTap: () {
          Navigator.of(context).pop();
          // Handle onTap action if needed
        },
        barIcon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.Primary_color,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Reset Password",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                  fontSize: 22.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "the password should be different then the previous one ",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.SecondaryColor,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
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
                height: 25.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                ),
                child: PasswordFeild(
                  controller: confirmPasswordController,
                  obscureText: true,
                  showSuffixIcon: true,
                  titel: "Confirm Password",
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              resetProviderState.hasErrors
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
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
              BtnWidget(
                btnText: "Reset password",
                onTap: () {
                  resetProviderNotifier.reset(passwordController.text);
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
