// ignore_for_file: non_constant_identifier_names, file_names, unused_local_variable, empty_catches
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ortho/repository/auth/auth.dart';

final StartUpProvider =
    StateNotifierProvider<StartUpStateNotifier, StartUpState>(
  (ref) => StartUpStateNotifier(),
);

class StartUpStateNotifier extends StateNotifier<StartUpState> {
  StartUpStateNotifier() : super(StartUpState.initial());

  // Add your state modification methods here

  void startUp() async {
    try {
      state = state.copyWith(isLoading: true);
      final data = await AuthRepository.tookenInfo();
      state = state.copyWith(
        isLoading: false,
        authState: AuthState.authenticated,
        errors: [],
        hasErrors: false,
      );
    } on DioException catch (e) {
      state = state.copyWith(
        authState: AuthState.failed,
        hasErrors: true,
      );
    } catch (e) {
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

class StartUpState {
  final AuthState authState;
  final bool hasErrors;
  final bool isLoading;

  StartUpState({
    required this.authState,
    required this.hasErrors,
    required this.isLoading,
  });

  StartUpState.initial()
      : authState = AuthState.unauthenticated,
        hasErrors = false,
        isLoading = true;

  StartUpState copyWith({
    AuthState? authState,
    List<String>? errors,
    bool? hasErrors,
    bool? isLoading,
  }) {
    return StartUpState(
      authState: authState ?? this.authState,
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
