// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:ortho/shared/networking/networking.dart';
import 'package:ortho/shared/networking/results.dart';

class OtpRepository {
  static Future<String> verify(String id, String otp) async {
    final result = await Networking.post('/otp/$id/verify', {"otp": otp});
    debugPrint(otp);
    final value = switch (result) {
      Success(value: final v) => v.data["data"],
      Failure(failure: final f) => throw f,
      Error(exception: final e) => throw e,
    };
    return value;
  }

  static Future<String> resend(String id) async {
    final result = await Networking.post('/otp/$id/resend', {});
    final value = switch (result) {
      Success(value: final v) => v.data['data'],
      Failure(failure: final f) => throw f,
      Error(exception: final e) => throw e,
    };
    return value;
  }
}
