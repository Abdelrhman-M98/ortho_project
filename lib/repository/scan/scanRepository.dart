// ignore_for_file: file_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ortho/models/sendScan/analysis_data.dart';
import 'package:ortho/shared/networking/networking.dart';
import 'package:ortho/shared/networking/results.dart';

class ScanRepository {
  static Future scan(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    final result = await Networking.post('/scan', formData);
    final value = switch (result) {
      Success(value: final v) => AnalysisData.fromJson(v.data['data']),
      Failure(failure: final f) => throw f,
      Error(exception: final e) => throw e,
    };
    return value;
  }
}
