// ignore_for_file: empty_catches, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ortho/repository/otp/otpRepository.dart';

final otpProvider = StateNotifierProviderFamily<OtpProviderStateNotifier,
    OtpProviderState, String>((ref, String otpId) {
  return OtpProviderStateNotifier(otpId);
});

class OtpProviderStateNotifier extends StateNotifier<OtpProviderState> {
  OtpProviderStateNotifier(String otpId)
      : super(OtpProviderState.initial(otpId));

  // Add your state modification methods here

  void otpVerify(String code) async {
    try {
      state = state.copyWith(
        isLoading: true,
        authState: AuthState.authenticating,
      );
      await OtpRepository.verify(state.otpId, code);
      state = state.copyWith(
        authState: AuthState.authenticated,
        errors: [],
        hasErrors: false,
      );
    } on DioException catch (e) {
      debugPrint(e.response!.toString());
      List errorList = e.response!.data['message'];
      List<String> errors = List<String>.from(errorList);

      state = state.copyWith(
        authState: AuthState.failed,
        errors: errors,
        hasErrors: true,
      );
    } catch (e) {
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void resendOtp() async {
    try {
      state = state.copyWith(
        isLoading: true,
        authState: AuthState.authenticating,
      );
      final newOtpId = await OtpRepository.resend(state.otpId);
      state = state.copyWith(
        otpId: newOtpId,
        authState: AuthState.unauthenticated,
        hasErrors: false,
        errors: [],
      );
    } on DioException catch (e) {
      debugPrint(e.response!.toString());
      List errorList = e.response!.data['message'];
      List<String> errors = List<String>.from(errorList);

      state = state.copyWith(
        authState: AuthState.failed,
        errors: errors,
        hasErrors: true,
      );
    } catch (e) {
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

class OtpProviderState {
  final AuthState authState;
  final List<String> errors;
  final bool hasErrors;
  final bool isLoading;
  final String otpId;

  OtpProviderState({
    required this.authState,
    required this.errors,
    required this.hasErrors,
    required this.isLoading,
    required this.otpId,
  });

  OtpProviderState.initial(this.otpId)
      : authState = AuthState.unauthenticated,
        errors = [],
        hasErrors = false,
        isLoading = false;

  OtpProviderState copyWith(
      {AuthState? authState,
      List<String>? errors,
      bool? hasErrors,
      bool? isLoading,
      String? otpId}) {
    return OtpProviderState(
      authState: authState ?? this.authState,
      errors: errors ?? this.errors,
      hasErrors: hasErrors ?? this.hasErrors,
      isLoading: isLoading ?? this.isLoading,
      otpId: otpId ?? this.otpId,
    );
  }
}

enum AuthState {
  unauthenticated,
  authenticated,
  authenticating,
  failed,
}
