// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_With_loading_Sppiner.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/components/PasswordField.dart';
import 'package:ortho/screens/SignUp/PasswordStateNotifier.dart';

class PasswordPage extends HookConsumerWidget {
  final String token;

  const PasswordPage({
    super.key,
    required this.token,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignUpNotifier = ref.watch(signUpProvider.notifier);
    final SignUpProviderState = ref.watch(signUpProvider);

    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    ref.listen(signUpProvider, (previous, next) {
      if (next.authState != AuthState.authenticated) {
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordPage(token: token),
        ),
      );
    });
// Validator for password field
    String? passwordValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Password is required';
      }

      if (value.length < 8) {
        return 'Password must be at least 8 characters long';
      }

      // Regex pattern to check if password contains at least one uppercase letter, one lowercase letter, one digit, and one special character
      RegExp regex = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|:"<>?~`\-=[\]\\;\,./]).{8,}$');

      if (!regex.hasMatch(value)) {
        return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character';
      }

      return null;
    }

// Validator for confirm password field
    String? confirmPasswordValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Confirm Password is required';
      }

      if (value != passwordController.text) {
        return 'Passwords do not match';
      }

      return null;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        titleText: 'Back',
        onTap: () {
          Navigator.of(context).pop();
        },
        barIcon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.Primary_color,
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose a password",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                    fontSize: 20.sp,
                    color: AppColors.Head_Text,
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
                "Make sure it’s 8 characters or more, it should be something others Couldn’t guess",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.SecondaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: PasswordFeild(
                titel: "Password",
                controller: passwordController,
                showSuffixIcon: true,
                obscureText: true,
                validator: (value) {
                  return passwordValidator(value);
                },
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: PasswordFeild(
                titel: "Confirm Password",
                controller: confirmPasswordController,
                showSuffixIcon: true,
                obscureText: true,
                validator: (value) {
                  return confirmPasswordValidator(value);
                },
              ),
            ),
            SignUpProviderState.hasErrors
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .end, // Align items horizontally to the end (right side)
                      children: [
                        SizedBox(
                          height: 30.0 * SignUpProviderState.errors.length,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: SignUpProviderState.errors.length,
                            itemBuilder: (context, index) {
                              return Text(
                                SignUpProviderState.errors[index],
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
            Spinner_BTN(
              isLoading: SignUpProviderState.isLoading,
              btnText: SignUpProviderState.isLoading ? 'Loading...' : 'Get OTP',
              onTap: () {
                if (SignUpProviderState.isLoading) {
                  return;
                }
                if (!formKey.currentState!.validate()) {
                  return;
                }

                debugPrint(token);
                SignUpNotifier.signUp(
                  token,
                  confirmPasswordController.text,
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
