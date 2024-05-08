// ignore_for_file: non_constant_identifier_names, file_names, unused_local_variable, empty_catches
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ortho/models/homeData/home_data.dart';
import 'package:ortho/repository/home/homeRepository.dart';

final HomeProvider =
    AutoDisposeStateNotifierProvider<HomeStateNotifier, HomeState>(
  (ref) => HomeStateNotifier(),
);

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier() : super(HomeState.initial());

  // Add your state modification methods here

  void Home() async {
    try {
      state = state.copyWith(isLoading: true);
      final data = await HomeRepository.home();
      state = state.copyWith(
        authState: AuthState.authenticated,
        errors: [],
        hasErrors: false,
      );
    } on DioException catch (e) {
      List errorList = e.response!.data['message'];
      List<String> errors = List<String>.from(errorList);
      debugPrint(errors.toString());

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

class HomeState {
  final AuthState authState;
  final List<String> errors;
  final bool hasErrors;
  final bool isLoading;
  HomeData? data;

  HomeState({
    required this.authState,
    required this.errors,
    required this.hasErrors,
    required this.isLoading,
    this.data,
  });

  HomeState.initial()
      : authState = AuthState.unauthenticated,
        errors = [],
        hasErrors = false,
        isLoading = false,
        data = null;

  HomeState copyWith({
    AuthState? authState,
    List<String>? errors,
    bool? hasErrors,
    bool? isLoading,
    HomeData? data,
  }) {
    return HomeState(
      authState: authState ?? this.authState,
      errors: errors ?? this.errors,
      hasErrors: hasErrors ?? this.hasErrors,
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
    );
  }
}

enum AuthState {
  unauthenticated,
  authenticated,
  authenticating,
  failed,
}
