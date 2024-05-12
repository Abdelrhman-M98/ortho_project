// ignore_for_file: file_names, unused_local_variable

import 'package:ortho/shared/networking/networking.dart';
import 'package:ortho/shared/networking/results.dart';

class ResetRepository {
  static reset(String token, String password) async {
    final result = await Networking.post('/auth/reset', {
      'token': token,
      'password': password,
    });

    final value = switch (result) {
      Success(value: final v) => true,
      Failure(failure: final f) => throw f,
      Error(exception: final e) => throw e,
    };
  }

  static Future<String> requestReset(String mail) async {
    final result = await Networking.post('/auth/request-reset', {
      'email': mail,
    });
    final value = switch (result) {
      Success(value: final v) => v.data['data'],
      Failure(failure: final f) => throw f,
      Error(exception: final e) => throw e,
    };
    return value;
  }
}
