import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup.freezed.dart';
part 'signup.g.dart';

@freezed
abstract class SignUpData with _$SignUpData {
  const factory SignUpData({
    required String name,
    required String email,
    required String username,
    required String password,
  }) = _SignUpData;

  factory SignUpData.fromJson(Map<String, dynamic> json) =>
      _$SignUpDataFromJson(json);
}
