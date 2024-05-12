// ignore_for_file: empty_catches, file_names
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ortho/repository/otp/otpRepository.dart';

final resetOtpProvider = AutoDisposeStateNotifierProviderFamily<
    ResetStateNotifier, ResetState, String>(
  (ref, otpId) => ResetStateNotifier(otpId),
);

class ResetStateNotifier extends StateNotifier<ResetState> {
  ResetStateNotifier(String otpId) : super(ResetState.initial(otpId));

  Future<bool> otpVerify(String code) async {
    try {
      state = state.copyWith(
        isLoading: true,
        authState: ResetOtpPassState.loading,
        token: null,
      );
      final token = await OtpRepository.verify(state.otpId, code);
      state = state.copyWith(
        token: token,
        authState: ResetOtpPassState.ok,
        errors: [],
        hasErrors: false,
      );
    } on DioException catch (e) {
      debugPrint(e.response!.toString());
      List errorList = e.response!.data['message'];
      List<String> errors = List<String>.from(errorList);

      state = state.copyWith(
        authState: ResetOtpPassState.failed,
        errors: errors,
        hasErrors: true,
      );
    } catch (e) {
    } finally {
      state = state.copyWith(isLoading: false);
    }
    return true;
  }

  void resendOtp() async {
    try {
      state = state.copyWith(
        isLoading: true,
        authState: ResetOtpPassState.loading,
        token: null,
      );
      final newOtpId = await OtpRepository.resend(state.otpId);
      state = state.copyWith(
        otpId: newOtpId,
        authState: ResetOtpPassState.ok,
        hasErrors: false,
        errors: [],
      );
    } on DioException catch (e) {
      debugPrint(e.response!.toString());
      List errorList = e.response!.data['message'];
      List<String> errors = List<String>.from(errorList);

      state = state.copyWith(
        authState: ResetOtpPassState.failed,
        errors: errors,
        hasErrors: true,
      );
    } catch (e) {
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

class ResetState {
  final ResetOtpPassState authState;
  final List<String> errors;
  final bool hasErrors;
  final bool isLoading;
  final String otpId;
  final String? token;

  ResetState({
    required this.authState,
    required this.errors,
    required this.hasErrors,
    required this.isLoading,
    required this.otpId,
    required this.token,
  });

  ResetState.initial(this.otpId)
      : authState = ResetOtpPassState.noThing,
        errors = [],
        hasErrors = false,
        isLoading = false,
        token = null;

  ResetState copyWith({
    ResetOtpPassState? authState,
    List<String>? errors,
    bool? hasErrors,
    bool? isLoading,
    String? otpId,
    String? token,
  }) {
    return ResetState(
      authState: authState ?? this.authState,
      errors: errors ?? this.errors,
      hasErrors: hasErrors ?? this.hasErrors,
      isLoading: isLoading ?? this.isLoading,
      otpId: otpId ?? this.otpId,
      token: token ?? this.token,
    );
  }
}

enum ResetOtpPassState {
  ok,
  loading,
  failed,
  noThing,
}
