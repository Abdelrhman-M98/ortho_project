import 'package:ortho/models/signup/signup.dart';
import 'package:ortho/models/user/user.dart';
import 'package:ortho/shared/networking/networking.dart';
import 'package:ortho/shared/networking/results.dart';

class AuthRepository {
  static Future<User?> login(String email, String password) async {
    final result = await Networking.post('/login', {
      'email': email,
      'password': password,
    });

    final value = switch (result) {
      Success(value: final value) => User.fromJson(value.data),
      Failure() => null,
      Error() => null,
    };

    return value;
  }

  static Future<User?> register(SignUpData signupData) async {
    final result = await Networking.post('/register', {
      'email': signupData.email,
      'password': signupData.password,
      'name': signupData.name,
      'username': signupData.username,
    });

    final value = switch (result) {
      Success(value: final value) => User.fromJson(value.data),
      Failure() => null,
      Error() => null,
    };

    return value;
  }
}
