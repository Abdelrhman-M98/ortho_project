// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, file_names, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unused_local_variable, must_be_immutable, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/Btn_With_loading_Sppiner.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/screens/ResetPassword/Forgot_Password_Email_Page.dart';
import 'package:ortho/screens/ResetPassword/ResetOtpNotifier.dart';
import 'package:ortho/screens/ResetPassword/Reset_Pass_page.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class VerificationForgetPass extends HookConsumerWidget {
  VerificationForgetPass({
    required this.otpId,
  });
  final String otpId;

  final focusNode = FocusNode();
  bool isLoading = false;
  bool isPinCorrect = false;

  final countDownCtrl = CountdownController(autoStart: true);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final TextEditingController pinController = useTextEditingController();
    final otpProviderNotifier = ref.watch(resetOtpProvider(otpId).notifier);
    final otpProviderState = ref.watch(resetOtpProvider(otpId));
    final ctnEnded = useState(false);

    ref.listen(resetOtpProvider(otpId), (previous, next) {
      if (next.isLoading) {
        return;
      }
      if (next.authState == ResetOtpPassState.ok && next.token != null) {
        Route route = MaterialPageRoute(
          builder: (context) => ResetPassPage(
            token: next.token!,
          ),
        );
        Navigator.pushReplacement(context, route);
      }
      if (next.authState == ResetOtpPassState.failed) {
        isPinCorrect = false;
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        titleText: 'Back',
        onTap: () {
          Route route = MaterialPageRoute(
            builder: (context) => const ForgetPassPage(),
          );
          Navigator.pushReplacement(context, route);
        },
        barIcon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.Primary_color,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60.h,
          ),
          Text(
            "Check verification code ",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 27.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.Head_Text,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Text(
            "Enter the verification code we sent to your email",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Pinput(
                  forceErrorState: otpProviderState.errors.isNotEmpty,
                  controller: pinController,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  showCursor: false,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  length: 5,
                  onCompleted: (pin) async {
                    // debugPrint(pin);
                    // await otpProviderNotifier.otpVerify(pin);
                  },
                  validator: (pin) {
                    if (pin == null || pin.isEmpty) {
                      return "Enter Your OTP";
                    }
                    if (pin.length < 5) {
                      return "Enter a valid OTP";
                    }

                    if (otpProviderState.errors.isNotEmpty) {
                      return otpProviderState.errors.join("\n");
                    }
                    // _pinFocusNode.unfocus();
                    // SystemChannels.textInput.invokeMethod('TextInput.hide');
                    return null;
                  },
                  submittedPinTheme: PinTheme(
                    width: 50.w,
                    height: 67.h,
                    textStyle: TextStyle(
                        fontSize: 26.sp,
                        color: AppColors.dark_text,
                        fontWeight: FontWeight.w500),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.Primary_color,
                      ),
                      borderRadius: BorderRadius.circular(72),
                    ),
                  ),
                  defaultPinTheme: PinTheme(
                    width: 50.w,
                    height: 67.h,
                    textStyle: TextStyle(
                      fontSize: 26.sp,
                      color: AppColors.dark_text,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.Pin_Empty_color),
                      borderRadius: BorderRadius.circular(72),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 50.w,
                    height: 67.h,
                    textStyle: TextStyle(
                        fontSize: 26.sp,
                        color: AppColors.dark_text,
                        fontWeight: FontWeight.w500),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.Primary_color,
                      ),
                      borderRadius: BorderRadius.circular(72),
                    ),
                  ),
                  errorPinTheme: PinTheme(
                    width: 50.w,
                    height: 67.h,
                    textStyle: TextStyle(
                        fontSize: 26.sp,
                        color: AppColors.dark_text,
                        fontWeight: FontWeight.w500),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.Pin_error_color,
                      ),
                      borderRadius: BorderRadius.circular(72),
                    ),
                  ),
                  errorTextStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Nunito",
                    color: AppColors.Pin_error_color,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Resend verification code",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.FormNonFouceColor,
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              Visibility(
                visible: !ctnEnded.value,
                child: Countdown(
                  controller: countDownCtrl,
                  seconds: 60,
                  build: (BuildContext context, double time) {
                    return Text(
                      "(0:${time.toInt().toString()})",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14.sp,
                        color: AppColors.FormNonFouceColor,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                  onFinished: () {
                    ctnEnded.value = true;
                  },
                ),
              ),
              Visibility(
                visible: ctnEnded.value,
                child: GestureDetector(
                  onTap: () {
                    otpProviderNotifier.resendOtp();
                    ctnEnded.value = false;
                    countDownCtrl.restart();
                  },
                  child: Text(
                    "Resend",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 14.sp,
                      color: AppColors.Primary_color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
          const Spacer(),
          Center(
            child: SizedBox(
              width: 360.w,
              height: 60.h,
              child: Spinner_BTN(
                btnText: "Verify OTP",
                onTap: () {
                  otpProviderNotifier.otpVerify(pinController.text);
                  focusNode.unfocus();
                  formKey.currentState!.validate();
                },
                isLoading: otpProviderNotifier.state.isLoading,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
