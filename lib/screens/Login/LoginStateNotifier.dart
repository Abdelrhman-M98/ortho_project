// ignore_for_file: non_constant_identifier_names, file_names, empty_catches
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ortho/repository/auth/auth.dart';

final loginProvider =
    AutoDisposeStateNotifierProvider<LoginStateNotifier, LoginState>(
  (ref) => LoginStateNotifier(),
);

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(LoginState.initial());

  // Add your state modification methods here

  void login(String identifier, String password) async {
    try {
      state = state.copyWith(isLoading: true);
      await AuthRepository.login(identifier, password);
      state = state.copyWith(
        authState: AuthState.authenticated,
        errors: [],
        hasErrors: false,
      );
    } on DioException catch (e) {
      List errorList = e.response!.data['message'];
      List<String> errors = List<String>.from(errorList);
      debugPrint(errors.toString());

      List<String> userPassowrdErrors = [];
      List<String> userMailErrors = [];

      for (final error in errors) {
        if (error.toLowerCase().contains('password') ||
            error.toLowerCase().contains('credentials')) {
          userPassowrdErrors.add(error);
        }
        if (error.toLowerCase().contains('identifier')) {
          userMailErrors.add(error);
        }
      }
      state = state.copyWith(
          authState: AuthState.failed,
          errors: errors,
          hasErrors: true,
          userMailErrors: userMailErrors,
          userPassowrdErrors: userPassowrdErrors);
    } catch (e) {
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

class LoginState {
  final AuthState authState;
  final List<String> errors;
  final bool hasErrors;
  final bool isLoading;
  final List<String> userPassowrdErrors;
  final List<String> userMailErrors;

  LoginState({
    required this.authState,
    required this.errors,
    required this.hasErrors,
    required this.isLoading,
    required this.userPassowrdErrors,
    required this.userMailErrors,
  });

  LoginState.initial()
      : authState = AuthState.unauthenticated,
        errors = [],
        hasErrors = false,
        isLoading = false,
        userPassowrdErrors = [],
        userMailErrors = [];

  LoginState copyWith({
    AuthState? authState,
    List<String>? errors,
    bool? hasErrors,
    bool? isLoading,
    List<String>? userPassowrdErrors,
    List<String>? userMailErrors,
  }) {
    return LoginState(
      authState: authState ?? this.authState,
      errors: errors ?? this.errors,
      hasErrors: hasErrors ?? this.hasErrors,
      isLoading: isLoading ?? this.isLoading,
      userMailErrors: userMailErrors ?? this.userMailErrors,
      userPassowrdErrors: userPassowrdErrors ?? this.userPassowrdErrors,
    );
  }
}

enum AuthState {
  unauthenticated,
  authenticated,
  authenticating,
  failed,
}
