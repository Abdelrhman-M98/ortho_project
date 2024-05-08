import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/models/auth/SignUp.dart';
import 'package:ortho/repository/auth/auth.dart';

final signUpProvider =
    AutoDisposeStateNotifierProvider<PasswordStateNotifier, SignUpState>(
  (ref) => PasswordStateNotifier(),
);

class PasswordStateNotifier extends StateNotifier<SignUpState> {
  PasswordStateNotifier() : super(SignUpState.initial());

  // Add your state modification methods here

  void signUp(String token, String password) async {
    try {
      final signUp = SignUp(continuationKey: token, password: password);
      state = state.copyWith(
        isLoading: true,
        authState: AuthState.authenticating,
      );
      await AuthRepository.signUp(signUp);

      state = state.copyWith(
        authState: AuthState.authenticated,
        errors: [],
        hasErrors: false,
      );
    } on DioException catch (e) {
      debugPrint(e.response.toString());
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

class SignUpState {
  final AuthState authState;
  final List<String> errors;
  final bool hasErrors;
  final bool isLoading;

  SignUpState({
    required this.authState,
    required this.errors,
    required this.hasErrors,
    required this.isLoading,
  });

  SignUpState.initial()
      : authState = AuthState.unauthenticated,
        errors = [],
        hasErrors = false,
        isLoading = false;

  SignUpState copyWith({
    AuthState? authState,
    List<String>? errors,
    bool? hasErrors,
    bool? isLoading,
  }) {
    return SignUpState(
      authState: authState ?? this.authState,
      errors: errors ?? this.errors,
      hasErrors: hasErrors ?? this.hasErrors,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

enum AuthState {
  unauthenticated,
  authenticated,
  authenticating,
  failed,
}
