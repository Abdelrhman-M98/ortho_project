// ignore_for_file: empty_catches, file_names, unused_local_variable
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ortho/repository/reset/resetRepository.dart';

final resetProvider =
    AutoDisposeStateNotifierProvider<ResetStateNotifier, ResetState>(
  (ref) => ResetStateNotifier(),
);

class ResetStateNotifier extends StateNotifier<ResetState> {
  ResetStateNotifier() : super(ResetState.initial());

  void requestReset(String email) async {
    try {
      state = state.copyWith(isLoading: true);
      final String otpId = await ResetRepository.requestReset(email);
      state = state.copyWith(
        otpId: otpId,
        authState: ResetPassState.ok,
        errors: [],
        hasErrors: false,
      );
    } on DioException catch (e) {
      debugPrint(e.response!.toString());
      List errorList = e.response!.data['message'];
      List<String> errors = List<String>.from(errorList);

      debugPrint(errors.toString());

      state = state.copyWith(
        authState: ResetPassState.failed,
        errors: errors,
        hasErrors: true,
      );
    } catch (e) {
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void reset(String token, String password) async {
    try {
      state = state.copyWith(isLoading: true);
      await ResetRepository.reset(token, password);
      state = state.copyWith(
        authState: ResetPassState.ok,
        errors: [],
        hasErrors: false,
      );
    } on DioException catch (e) {
      List errorList = e.response!.data['message'];
      List<String> errors = List<String>.from(errorList);
      state = state.copyWith(
        authState: ResetPassState.failed,
        errors: errors,
        hasErrors: true,
      );
    } catch (e) {
      state = state.copyWith(
        authState: ResetPassState.failed,
        errors: ['An unexpected error occurred'],
        hasErrors: true,
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

class ResetState {
  final ResetPassState authState;
  final List<String> errors;
  final bool hasErrors;
  final bool isLoading;
  final String? otpId;
  final String? token;

  ResetState({
    required this.authState,
    required this.errors,
    required this.hasErrors,
    required this.isLoading,
    required this.otpId,
    required this.token,
  });

  ResetState.initial()
      : authState = ResetPassState.noThing,
        errors = [],
        hasErrors = false,
        isLoading = false,
        token = null,
        otpId = null;

  ResetState copyWith({
    ResetPassState? authState,
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

enum ResetPassState {
  ok,
  loading,
  failed,
  noThing,
}
