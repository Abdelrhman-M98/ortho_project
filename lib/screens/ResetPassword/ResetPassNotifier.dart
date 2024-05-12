// ignore_for_file: empty_catches, file_names, unused_local_variable, unnecessary_this
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ortho/repository/reset/resetRepository.dart';

final resetPassProvider = AutoDisposeStateNotifierProviderFamily<
    ResetStateNotifier, ResetState, String>(
  (ref, token) => ResetStateNotifier(token),
);

class ResetStateNotifier extends StateNotifier<ResetState> {
  ResetStateNotifier(String token) : super(ResetState.initial(token));

  void reset(String password) async {
    try {
      state = state.copyWith(isLoading: true);
      await ResetRepository.reset(state.token, password);
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
  final String token;

  ResetState({
    required this.authState,
    required this.errors,
    required this.hasErrors,
    required this.isLoading,
    required this.token,
  });

  ResetState.initial(this.token)
      : authState = ResetPassState.noThing,
        errors = [],
        hasErrors = false,
        isLoading = false;

  ResetState copyWith({
    ResetPassState? authState,
    List<String>? errors,
    bool? hasErrors,
    bool? isLoading,
  }) {
    return ResetState(
      authState: authState ?? this.authState,
      errors: errors ?? this.errors,
      hasErrors: hasErrors ?? this.hasErrors,
      isLoading: isLoading ?? this.isLoading,
      token: this.token,
    );
  }
}

enum ResetPassState {
  ok,
  loading,
  failed,
  noThing,
}
