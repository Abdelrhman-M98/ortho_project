// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:ortho/models/auth/SignUp.dart';
import 'package:ortho/models/auth/SignUpRequest.dart';
import 'package:ortho/shared/networking/networking.dart';
import 'package:ortho/shared/networking/results.dart';

class AuthRepository {
  static Future<bool> login(String email, String password) async {
    final result = await Networking.post('/auth/signin', {
      'identifier': email,
      'password': password,
    });
    debugPrint(result.toString());
    final value = switch (result) {
      Success(value: final v) => true,
      Failure(failure: final f) => throw f,
      Error(exception: final e) => throw e,
    };
    return value;
  }

  static Future<String> requestSignUp(SignUpRequest signUpRequest) async {
    final result = await Networking.post('/auth/request-singup', {
      'name': signUpRequest.name,
      'email': signUpRequest.email,
    });

    final value = switch (result) {
      Success(value: final v) => v.data['data']['continuationKey'],
      Failure(failure: final f) => throw f,
      Error(exception: final e) => throw e,
    };

    return value;
  }

  static Future<String> signUp(SignUp signUp) async {
    final result = await Networking.post('/auth/signup', {
      'continuationKey': signUp.continuationKey,
      'password': signUp.password,
    });
    final value = switch (result) {
      Success(value: final v) => v.data['data'],
      Failure(failure: final f) => throw f,
      Error(exception: final e) => throw e,
    };
    return value;
  }

  static Future<bool> tookenInfo() async {
    final result = await Networking.get('/auth/token-info', {});
    final value = switch (result) {
      Success(value: final v) => true,
      Failure(failure: final f) => throw f,
      Error(exception: final e) => throw e,
    };
    return value;
  }
}
