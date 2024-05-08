// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return _HomeData.fromJson(json);
}

/// @nodoc
mixin _$HomeData {
  List<ScanData> get recentScans => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeDataCopyWith<HomeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDataCopyWith<$Res> {
  factory $HomeDataCopyWith(HomeData value, $Res Function(HomeData) then) =
      _$HomeDataCopyWithImpl<$Res, HomeData>;
  @useResult
  $Res call({List<ScanData> recentScans, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$HomeDataCopyWithImpl<$Res, $Val extends HomeData>
    implements $HomeDataCopyWith<$Res> {
  _$HomeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentScans = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      recentScans: null == recentScans
          ? _value.recentScans
          : recentScans // ignore: cast_nullable_to_non_nullable
              as List<ScanData>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeDataImplCopyWith<$Res>
    implements $HomeDataCopyWith<$Res> {
  factory _$$HomeDataImplCopyWith(
          _$HomeDataImpl value, $Res Function(_$HomeDataImpl) then) =
      __$$HomeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ScanData> recentScans, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$HomeDataImplCopyWithImpl<$Res>
    extends _$HomeDataCopyWithImpl<$Res, _$HomeDataImpl>
    implements _$$HomeDataImplCopyWith<$Res> {
  __$$HomeDataImplCopyWithImpl(
      _$HomeDataImpl _value, $Res Function(_$HomeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentScans = null,
    Object? user = null,
  }) {
    return _then(_$HomeDataImpl(
      recentScans: null == recentScans
          ? _value._recentScans
          : recentScans // ignore: cast_nullable_to_non_nullable
              as List<ScanData>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeDataImpl implements _HomeData {
  const _$HomeDataImpl(
      {required final List<ScanData> recentScans, required this.user})
      : _recentScans = recentScans;

  factory _$HomeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeDataImplFromJson(json);

  final List<ScanData> _recentScans;
  @override
  List<ScanData> get recentScans {
    if (_recentScans is EqualUnmodifiableListView) return _recentScans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentScans);
  }

  @override
  final User user;

  @override
  String toString() {
    return 'HomeData(recentScans: $recentScans, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeDataImpl &&
            const DeepCollectionEquality()
                .equals(other._recentScans, _recentScans) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_recentScans), user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeDataImplCopyWith<_$HomeDataImpl> get copyWith =>
      __$$HomeDataImplCopyWithImpl<_$HomeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeDataImplToJson(
      this,
    );
  }
}

abstract class _HomeData implements HomeData {
  const factory _HomeData(
      {required final List<ScanData> recentScans,
      required final User user}) = _$HomeDataImpl;

  factory _HomeData.fromJson(Map<String, dynamic> json) =
      _$HomeDataImpl.fromJson;

  @override
  List<ScanData> get recentScans;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$HomeDataImplCopyWith<_$HomeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
