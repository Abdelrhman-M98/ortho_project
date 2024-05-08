// ignore_for_file: non_constant_identifier_names, file_names, unused_local_variable, empty_catches
// ignore: depend_on_referenced_packages
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ortho/models/sendScan/analysis_data.dart';
import 'package:ortho/repository/scan/scanRepository.dart';

final ScanProvider =
    AutoDisposeStateNotifierProvider<ScanStateNotifier, ScanState>(
  (ref) => ScanStateNotifier(),
);

class ScanStateNotifier extends StateNotifier<ScanState> {
  ScanStateNotifier() : super(ScanState.initial());

  // Add your state modification methods here

  void scan(File file) async {
    try {
      state = state.copyWith(isLoading: true);
      final data = await ScanRepository.scan(file);
      state = state.copyWith(
        authState: ResponseState.ok,
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
      state = state.copyWith(isLoading: false);
    }
  }
}

class ScanState {
  AnalysisData? data;
  final ResponseState authState;
  final List<String> errors;
  final bool hasErrors;
  final bool isLoading;

  ScanState({
    required this.authState,
    required this.errors,
    required this.hasErrors,
    required this.isLoading,
    this.data,
  });

  ScanState.initial()
      : authState = ResponseState.unauthenticated,
        errors = [],
        hasErrors = false,
        isLoading = false,
        data = null;

  ScanState copyWith({
    ResponseState? authState,
    List<String>? errors,
    bool? hasErrors,
    bool? isLoading,
    AnalysisData? data,
  }) {
    return ScanState(
      authState: authState ?? this.authState,
      errors: errors ?? this.errors,
      hasErrors: hasErrors ?? this.hasErrors,
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
    );
  }
}

enum ResponseState {
  unauthenticated,
  ok,
  failed,
}
