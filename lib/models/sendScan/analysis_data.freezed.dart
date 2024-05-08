// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalysisData _$AnalysisDataFromJson(Map<String, dynamic> json) {
  return _AnalysisData.fromJson(json);
}

/// @nodoc
mixin _$AnalysisData {
  String get userId => throw _privateConstructorUsedError;
  List<ModelResult> get data => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalysisDataCopyWith<AnalysisData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisDataCopyWith<$Res> {
  factory $AnalysisDataCopyWith(
          AnalysisData value, $Res Function(AnalysisData) then) =
      _$AnalysisDataCopyWithImpl<$Res, AnalysisData>;
  @useResult
  $Res call(
      {String userId,
      List<ModelResult> data,
      int id,
      String image,
      @JsonKey(name: 'createdAt') DateTime createdAt});
}

/// @nodoc
class _$AnalysisDataCopyWithImpl<$Res, $Val extends AnalysisData>
    implements $AnalysisDataCopyWith<$Res> {
  _$AnalysisDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? data = null,
    Object? id = null,
    Object? image = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ModelResult>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalysisDataImplCopyWith<$Res>
    implements $AnalysisDataCopyWith<$Res> {
  factory _$$AnalysisDataImplCopyWith(
          _$AnalysisDataImpl value, $Res Function(_$AnalysisDataImpl) then) =
      __$$AnalysisDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      List<ModelResult> data,
      int id,
      String image,
      @JsonKey(name: 'createdAt') DateTime createdAt});
}

/// @nodoc
class __$$AnalysisDataImplCopyWithImpl<$Res>
    extends _$AnalysisDataCopyWithImpl<$Res, _$AnalysisDataImpl>
    implements _$$AnalysisDataImplCopyWith<$Res> {
  __$$AnalysisDataImplCopyWithImpl(
      _$AnalysisDataImpl _value, $Res Function(_$AnalysisDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? data = null,
    Object? id = null,
    Object? image = null,
    Object? createdAt = null,
  }) {
    return _then(_$AnalysisDataImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ModelResult>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalysisDataImpl implements _AnalysisData {
  const _$AnalysisDataImpl(
      {required this.userId,
      required final List<ModelResult> data,
      required this.id,
      required this.image,
      @JsonKey(name: 'createdAt') required this.createdAt})
      : _data = data;

  factory _$AnalysisDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisDataImplFromJson(json);

  @override
  final String userId;
  final List<ModelResult> _data;
  @override
  List<ModelResult> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int id;
  @override
  final String image;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;

  @override
  String toString() {
    return 'AnalysisData(userId: $userId, data: $data, id: $id, image: $image, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId,
      const DeepCollectionEquality().hash(_data), id, image, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisDataImplCopyWith<_$AnalysisDataImpl> get copyWith =>
      __$$AnalysisDataImplCopyWithImpl<_$AnalysisDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisDataImplToJson(
      this,
    );
  }
}

abstract class _AnalysisData implements AnalysisData {
  const factory _AnalysisData(
          {required final String userId,
          required final List<ModelResult> data,
          required final int id,
          required final String image,
          @JsonKey(name: 'createdAt') required final DateTime createdAt}) =
      _$AnalysisDataImpl;

  factory _AnalysisData.fromJson(Map<String, dynamic> json) =
      _$AnalysisDataImpl.fromJson;

  @override
  String get userId;
  @override
  List<ModelResult> get data;
  @override
  int get id;
  @override
  String get image;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$AnalysisDataImplCopyWith<_$AnalysisDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
