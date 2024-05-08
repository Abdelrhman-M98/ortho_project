// ignore_for_file: empty_catches, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ortho/models/auth/SignUpRequest.dart';
import 'package:ortho/repository/auth/auth.dart';

final authProvider =
    AutoDisposeStateNotifierProvider<SignupStateNotifier, SignupState>(
  (ref) => SignupStateNotifier(),
);

class SignupStateNotifier extends StateNotifier<SignupState> {
  SignupStateNotifier() : super(SignupState.initial());

  // Add your state modification methods here

  void requestRegister(SignUpRequest signUpRequest) async {
    try {
      state = state.copyWith(isLoading: true);
      final token = await AuthRepository.requestSignUp(signUpRequest);
      debugPrint(token);
      state = state.copyWith(
        token: token,
        authState: AuthState.authenticating,
        errors: [],
        hasErrors: false,
      );
    } on DioException catch (e) {
      debugPrint(e.response!.toString());
      List errorList = e.response!.data['message'];
      List<String> errors = List<String>.from(errorList);

      List<String> userNameErrors = [];
      List<String> userMailErrors = [];
      for (final error in errors) {
        if (error.toLowerCase().contains('name')) {
          userNameErrors.add(error);
        }
        if (error.toLowerCase().contains('email')) {
          userMailErrors.add(error);
        }
      }
      debugPrint(userMailErrors.toString());

      state = state.copyWith(
        authState: AuthState.failed,
        errors: errors,
        hasErrors: true,
        token: null,
        userMailErrors: userMailErrors,
        userNameErrors: userNameErrors,
      );
    } catch (e) {
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

class SignupState {
  final List<String> userNameErrors;
  final List<String> userMailErrors;
  final String? token;
  final AuthState authState;
  final List<String> errors;
  final bool hasErrors;
  final bool isLoading;

  SignupState({
    required this.userNameErrors,
    required this.userMailErrors,
    required this.token,
    required this.authState,
    required this.errors,
    required this.hasErrors,
    required this.isLoading,
  });

  SignupState.initial()
      : authState = AuthState.unauthenticated,
        errors = [],
        hasErrors = false,
        isLoading = false,
        token = null,
        userNameErrors = [],
        userMailErrors = [];

  SignupState copyWith({
    AuthState? authState,
    List<String>? errors,
    bool? hasErrors,
    bool? isLoading,
    List<String>? userNameErrors,
    List<String>? userMailErrors,
    String? token,
  }) {
    return SignupState(
      token: token,
      authState: authState ?? this.authState,
      errors: errors ?? this.errors,
      hasErrors: hasErrors ?? this.hasErrors,
      isLoading: isLoading ?? this.isLoading,
      userNameErrors: userNameErrors ?? this.userNameErrors,
      userMailErrors: userMailErrors ?? this.userMailErrors,
    );
  }
}

enum AuthState {
  unauthenticated,
  authenticated,
  authenticating,
  failed,
}
