// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignUpData _$SignUpDataFromJson(Map<String, dynamic> json) {
  return _SignUpData.fromJson(json);
}

/// @nodoc
mixin _$SignUpData {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpDataCopyWith<SignUpData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpDataCopyWith<$Res> {
  factory $SignUpDataCopyWith(
          SignUpData value, $Res Function(SignUpData) then) =
      _$SignUpDataCopyWithImpl<$Res, SignUpData>;
  @useResult
  $Res call({String name, String email, String username, String password});
}

/// @nodoc
class _$SignUpDataCopyWithImpl<$Res, $Val extends SignUpData>
    implements $SignUpDataCopyWith<$Res> {
  _$SignUpDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpDataImplCopyWith<$Res>
    implements $SignUpDataCopyWith<$Res> {
  factory _$$SignUpDataImplCopyWith(
          _$SignUpDataImpl value, $Res Function(_$SignUpDataImpl) then) =
      __$$SignUpDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String username, String password});
}

/// @nodoc
class __$$SignUpDataImplCopyWithImpl<$Res>
    extends _$SignUpDataCopyWithImpl<$Res, _$SignUpDataImpl>
    implements _$$SignUpDataImplCopyWith<$Res> {
  __$$SignUpDataImplCopyWithImpl(
      _$SignUpDataImpl _value, $Res Function(_$SignUpDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$SignUpDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpDataImpl implements _SignUpData {
  const _$SignUpDataImpl(
      {required this.name,
      required this.email,
      required this.username,
      required this.password});

  factory _$SignUpDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpDataImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpData(name: $name, email: $email, username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpDataImplCopyWith<_$SignUpDataImpl> get copyWith =>
      __$$SignUpDataImplCopyWithImpl<_$SignUpDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpDataImplToJson(
      this,
    );
  }
}

abstract class _SignUpData implements SignUpData {
  const factory _SignUpData(
      {required final String name,
      required final String email,
      required final String username,
      required final String password}) = _$SignUpDataImpl;

  factory _SignUpData.fromJson(Map<String, dynamic> json) =
      _$SignUpDataImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$SignUpDataImplCopyWith<_$SignUpDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
