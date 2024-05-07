import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/models/auth/SignUp.dart';
import 'package:ortho/models/auth/SignUpRequest.dart';
import 'package:ortho/shared/networking/networking.dart';

class AuthRepository {
  static Future login(String email, String password) async {
    return Networking.post('/auth/signin', {
      'email': email,
      'password': password,
    });
  }

  static requestSignUp(SignUpRequest signUpRequest) async {
    return Networking.post('/auth/request-singup', {
      'name': signUpRequest.name,
      'email': signUpRequest.email,
    });
  }

  static signUp(SignUp signUp) async {
    return Networking.post('/auth/singup', {
      'continuationKey': signUp.continuationKey,
      'password': signUp.password,
    });
  }

  // Providers
  static final requestSignUpProvider = FutureProvider.family(
    (ref, SignUpRequest signUpRequest) => requestSignUp(signUpRequest),
  );

  static final signUpProvider = FutureProvider.family(
    (ref, SignUp signUpData) => signUp(signUpData),
  );
}
