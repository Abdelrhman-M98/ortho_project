// ignore_for_file: unused_local_variable

import 'package:ortho/models/user/user.dart';
import 'package:ortho/shared/networking/networking.dart';
import 'package:ortho/shared/networking/results.dart';

class UserRepository {
  static Future<User> user() async {
    final result = await Networking.get('/user', {});
    final value = switch (result) {
      Success(value: final v) => User.fromJson(v.data["data"]),
      Failure(failure: final f) => throw f,
      Error(exception: final e) => throw e,
    };
    return value;
  }
}
