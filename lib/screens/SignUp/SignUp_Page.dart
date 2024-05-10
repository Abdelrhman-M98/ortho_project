// ignore_for_file: prefer_is_empty, file_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_With_loading_Sppiner.dart';
import 'package:ortho/components/InputField.dart';
import 'package:ortho/models/auth/SignUpRequest.dart';
import 'package:ortho/screens/Login/Login_page.dart';
import 'package:ortho/screens/OnBoard/OnBoard_Page.dart';
import 'package:ortho/screens/SignUp/Password_page.dart';
import 'package:ortho/screens/SignUp/SignupStateNotifier.dart';
import 'package:ortho/screens/TermOfPolicy/terms_of_use.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final nameField = useTextEditingController();
    final authProviderNotifier = ref.watch(authProvider.notifier);
    final authProviderState = ref.watch(authProvider);
    ref.listen(
      authProvider,
      (previous, next) {
        if (next.token == null) {
          return;
        }
        String token = next.token!;
        Route route =
            MaterialPageRoute(builder: (context) => PasswordPage(token: token));
        Navigator.push(context, route);
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.close,
            ),
            onPressed: () {
              if (authProviderState.authState == AuthState.unauthenticated) {
                Route route =
                    MaterialPageRoute(builder: (context) => const LoginPage());
                Navigator.pushReplacement(context, route);
              } else {
                Route route =
                    MaterialPageRoute(builder: (context) => const OnBoarding());
                Navigator.pushReplacement(context, route);
              }
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: TextButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => const LoginPage());
                Navigator.pushReplacement(context, route);
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark_text,
                ),
              ),
            ),
          ),
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
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
          Route route =
              MaterialPageRoute(builder: (context) => const LoginPage());
          Navigator.pushReplacement(context, route);
        },
        child: SingleChildScrollView(
          reverse: true,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
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
                    color: AppColors.SecondaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InputFeild(
                  setErrorSate: authProviderState.userNameErrors.length > 0,
                  showSuffixIcon: true,
                  titel: 'Name',
                  controller: nameField,
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              authProviderState.hasErrors
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .end, // Align items horizontally to the end (right side)
                        children: [
                          SizedBox(
                            height:
                                30.0 * authProviderState.userNameErrors.length,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  authProviderState.userNameErrors.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  authProviderState.userNameErrors[index],
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
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: InputFeild(
                  setErrorSate: authProviderState.userMailErrors.length > 0,
                  showSuffixIcon: true,
                  titel: 'Eamil Adderss',
                  controller: emailController,
                  validator: (value) {
                    return;
                  },
                ),
              ),
              authProviderState.hasErrors
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .end, // Align items horizontally to the end (right side)
                        children: [
                          SizedBox(
                            height:
                                30.0 * authProviderState.userMailErrors.length,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  authProviderState.userMailErrors.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  authProviderState.userMailErrors[index],
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
              SizedBox(
                height:
                    MediaQuery.of(context).viewInsets.bottom > 0 ? 50.h : 280.h,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: TermsOfUse(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Spinner_BTN(
                btnText: authProviderState.isLoading ? 'Loading...' : 'Sign Up',
                onTap: () {
                  if (authProviderState.isLoading) {
                    return;
                  }

                  if (!authProviderState.hasErrors &&
                      authProviderState.token != null) {
                    return;
                  }

                  final email = emailController.text;
                  final name = nameField.text;
                  final signUpReqData = SignUpRequest(
                    email: email,
                    name: name,
                  );
                  authProviderNotifier.requestRegister(signUpReqData);
                },
                isLoading: authProviderState.isLoading,
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
