// ignore_for_file: file_names

import 'package:ortho/shared/networking/networking.dart';
import 'package:ortho/shared/networking/results.dart';

class ResetRepository {
  static Future<String> reset(String token, String password) async {
    final result = await Networking.post('/reset', {
      'token': token,
      'password': password,
    });

    final value = switch (result) {
      Success(value: final v) => v.data['data'],
      Failure(failure: final f) => throw f,
      Error(exception: final e) => throw e,
    };
    return value;
  }

  static Future<String> tookenInfo(String mail) async {
    final result = await Networking.get('/reset/request-reset', {
      'mail': mail,
    });
    final value = switch (result) {
      Success(value: final v) => v.data['data'],
      Failure(failure: final f) => throw f,
      Error(exception: final e) => throw e,
    };
    return value;
  }
}
