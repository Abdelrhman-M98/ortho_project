// ignore_for_file: non_constant_identifier_names, file_names, empty_catches
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ortho/models/user/user.dart';
import 'package:ortho/repository/user/user.dart';

final UserProvider =
    AutoDisposeStateNotifierProvider<UserStateNotifier, UserState>(
  (ref) => UserStateNotifier(),
);

class UserStateNotifier extends StateNotifier<UserState> {
  UserStateNotifier() : super(UserState.initial()) {
    user();
  }

  // Add your state modification methods here

  void user() async {
    try {
      state = state.copyWith(isLoading: true);
      final User user = await UserRepository.user();
      state = state.copyWith(
        user: user,
        authState: ResponseState.authenticated,
        errors: [],
        hasErrors: false,
      );
    } on DioException catch (e) {
      List errorList = e.response!.data['message'];
      List<String> errors = List<String>.from(errorList);
      debugPrint(errors.toString());

      state = state.copyWith(
        authState: ResponseState.failed,
        errors: errors,
        hasErrors: true,
      );
    } catch (e) {
    } finally {
      if (mounted) state = state.copyWith(isLoading: false);
    }
  }
}

class UserState {
  final User? user;
  final ResponseState authState;
  final List<String> errors;
  final bool hasErrors;
  final bool isLoading;

  UserState({
    required this.user,
    required this.authState,
    required this.errors,
    required this.hasErrors,
    required this.isLoading,
  });

  UserState.initial()
      : authState = ResponseState.unauthenticated,
        errors = [],
        hasErrors = false,
        isLoading = false,
        user = null;

  UserState copyWith({
    ResponseState? authState,
    List<String>? errors,
    bool? hasErrors,
    bool? isLoading,
    User? user,
  }) {
    return UserState(
      authState: authState ?? this.authState,
      errors: errors ?? this.errors,
      hasErrors: hasErrors ?? this.hasErrors,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}

enum ResponseState {
  unauthenticated,
  authenticated,
  authenticating,
  failed,
}
