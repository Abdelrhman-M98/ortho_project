import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/components/InputField.dart';
import 'package:ortho/models/auth/SignUp.dart';
import 'package:ortho/models/auth/SignUpRequest.dart';
import 'package:ortho/repository/auth/auth.dart';
import 'package:ortho/screens/Login/Login_page.dart';
import 'package:ortho/screens/SignUp/Password_page.dart';
import 'package:ortho/screens/TermOfPolicy/terms_of_use.dart';
import 'package:ortho/shared/networking/results.dart';

class SignUpPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef refs) {
    final emailController = useTextEditingController();
    final nameField = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final isLoading = useState(false);

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
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const LoginPage();
                    },
                  ),
                );
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
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
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
                showSuffixIcon: true,
                titel: 'User Name',
                controller: nameField,
                validator: (value) {
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: InputFeild(
                showSuffixIcon: true,
                titel: 'Eamil Adderss',
                controller: emailController,
                validator: (value) {
                  return null;
                },
              ),
            ),
            const Spacer(
              flex: 50,
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
            const Spacer(),
            BtnWidget(
              btnText: "Continue",
              onTap: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }

                final email = emailController.text;
                final name = nameField.text;
                final signUpReqData = SignUpRequest(
                  email: email,
                  name: name,
                );

                isLoading.value = true;
                refs
                    .read(AuthRepository.requestSignUpProvider(signUpReqData))
                    .when(
                  data: (data) {
                    isLoading.value = false;
                    final result = data as Result;
                    switch (result) {
                      case Success<dynamic, DioException, Exception>():
                        final res = result.value as Response;
                        final token =
                            res.data['data']['continuationKey'] as String;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const PasswordPage();
                            },
                          ),
                        );
                        break;
                      case Failure<dynamic, DioException, Exception>():
                        //validation error
                        final f = result.failure;
                        final failMsgs =
                            f.response!.data['message'] as List<String>;
                        debugPrint(failMsgs.toString());
                        final emailErrors = failMsgs
                            .where((element) => element.contains('email'))
                            .toList();
                        final nameErrors = failMsgs
                            .where((element) => element.contains('name'))
                            .toList();

                        if (emailErrors.isNotEmpty) {}
                        if (nameErrors.isNotEmpty) {}
                        break;
                      case Error<dynamic, DioException, Exception>():
                        final e = result.exception;
                        debugPrint(e.toString());
                        break;
                    }
                  },
                  loading: () {
                    debugPrint("loading");
                    isLoading.value = true;
                  },
                  error: (error, stackTrace) {
                    debugPrint("ASDFGHJ");
                  },
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
