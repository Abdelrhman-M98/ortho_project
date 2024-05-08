// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ortho/models/homeData/home_data.dart';
import 'package:ortho/shared/networking/networking.dart';
import 'package:ortho/shared/networking/results.dart';

class HomeRepository {
  static Future<HomeData> home() async {
    final result = await Networking.get('/home', {});
    debugPrint(result.toString());
    final value = switch (result) {
      Success(value: final v) => HomeData.fromJson(v.data['data']),
      Failure(failure: final f) => throw f,
      Error(exception: final e) => throw e,
    };
    return value;
  }
}
