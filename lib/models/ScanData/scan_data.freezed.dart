// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScanData _$ScanDataFromJson(Map<String, dynamic> json) {
  return _ScanData.fromJson(json);
}

/// @nodoc
mixin _$ScanData {
  String get id => throw _privateConstructorUsedError;
  String get imageBefore => throw _privateConstructorUsedError;
  String get imageAfter => throw _privateConstructorUsedError;
  ScanStatus get scanStatus => throw _privateConstructorUsedError;
  DateTime get scanTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScanDataCopyWith<ScanData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanDataCopyWith<$Res> {
  factory $ScanDataCopyWith(ScanData value, $Res Function(ScanData) then) =
      _$ScanDataCopyWithImpl<$Res, ScanData>;
  @useResult
  $Res call(
      {String id,
      String imageBefore,
      String imageAfter,
      ScanStatus scanStatus,
      DateTime scanTime});
}

/// @nodoc
class _$ScanDataCopyWithImpl<$Res, $Val extends ScanData>
    implements $ScanDataCopyWith<$Res> {
  _$ScanDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageBefore = null,
    Object? imageAfter = null,
    Object? scanStatus = null,
    Object? scanTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageBefore: null == imageBefore
          ? _value.imageBefore
          : imageBefore // ignore: cast_nullable_to_non_nullable
              as String,
      imageAfter: null == imageAfter
          ? _value.imageAfter
          : imageAfter // ignore: cast_nullable_to_non_nullable
              as String,
      scanStatus: null == scanStatus
          ? _value.scanStatus
          : scanStatus // ignore: cast_nullable_to_non_nullable
              as ScanStatus,
      scanTime: null == scanTime
          ? _value.scanTime
          : scanTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScanDataImplCopyWith<$Res>
    implements $ScanDataCopyWith<$Res> {
  factory _$$ScanDataImplCopyWith(
          _$ScanDataImpl value, $Res Function(_$ScanDataImpl) then) =
      __$$ScanDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String imageBefore,
      String imageAfter,
      ScanStatus scanStatus,
      DateTime scanTime});
}

/// @nodoc
class __$$ScanDataImplCopyWithImpl<$Res>
    extends _$ScanDataCopyWithImpl<$Res, _$ScanDataImpl>
    implements _$$ScanDataImplCopyWith<$Res> {
  __$$ScanDataImplCopyWithImpl(
      _$ScanDataImpl _value, $Res Function(_$ScanDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageBefore = null,
    Object? imageAfter = null,
    Object? scanStatus = null,
    Object? scanTime = null,
  }) {
    return _then(_$ScanDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageBefore: null == imageBefore
          ? _value.imageBefore
          : imageBefore // ignore: cast_nullable_to_non_nullable
              as String,
      imageAfter: null == imageAfter
          ? _value.imageAfter
          : imageAfter // ignore: cast_nullable_to_non_nullable
              as String,
      scanStatus: null == scanStatus
          ? _value.scanStatus
          : scanStatus // ignore: cast_nullable_to_non_nullable
              as ScanStatus,
      scanTime: null == scanTime
          ? _value.scanTime
          : scanTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScanDataImpl implements _ScanData {
  const _$ScanDataImpl(
      {required this.id,
      required this.imageBefore,
      required this.imageAfter,
      required this.scanStatus,
      required this.scanTime});

  factory _$ScanDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScanDataImplFromJson(json);

  @override
  final String id;
  @override
  final String imageBefore;
  @override
  final String imageAfter;
  @override
  final ScanStatus scanStatus;
  @override
  final DateTime scanTime;

  @override
  String toString() {
    return 'ScanData(id: $id, imageBefore: $imageBefore, imageAfter: $imageAfter, scanStatus: $scanStatus, scanTime: $scanTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageBefore, imageBefore) ||
                other.imageBefore == imageBefore) &&
            (identical(other.imageAfter, imageAfter) ||
                other.imageAfter == imageAfter) &&
            (identical(other.scanStatus, scanStatus) ||
                other.scanStatus == scanStatus) &&
            (identical(other.scanTime, scanTime) ||
                other.scanTime == scanTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, imageBefore, imageAfter, scanStatus, scanTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanDataImplCopyWith<_$ScanDataImpl> get copyWith =>
      __$$ScanDataImplCopyWithImpl<_$ScanDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScanDataImplToJson(
      this,
    );
  }
}

abstract class _ScanData implements ScanData {
  const factory _ScanData(
      {required final String id,
      required final String imageBefore,
      required final String imageAfter,
      required final ScanStatus scanStatus,
      required final DateTime scanTime}) = _$ScanDataImpl;

  factory _ScanData.fromJson(Map<String, dynamic> json) =
      _$ScanDataImpl.fromJson;

  @override
  String get id;
  @override
  String get imageBefore;
  @override
  String get imageAfter;
  @override
  ScanStatus get scanStatus;
  @override
  DateTime get scanTime;
  @override
  @JsonKey(ignore: true)
  _$$ScanDataImplCopyWith<_$ScanDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
