// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ModelResult _$ModelResultFromJson(Map<String, dynamic> json) {
  return _ModelResult.fromJson(json);
}

/// @nodoc
mixin _$ModelResult {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<double>? get classes => throw _privateConstructorUsedError;
  List<String>? get labels => throw _privateConstructorUsedError;
  int? get predictedIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelResultCopyWith<ModelResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelResultCopyWith<$Res> {
  factory $ModelResultCopyWith(
          ModelResult value, $Res Function(ModelResult) then) =
      _$ModelResultCopyWithImpl<$Res, ModelResult>;
  @useResult
  $Res call(
      {String? title,
      String? description,
      List<double>? classes,
      List<String>? labels,
      int? predictedIndex});
}

/// @nodoc
class _$ModelResultCopyWithImpl<$Res, $Val extends ModelResult>
    implements $ModelResultCopyWith<$Res> {
  _$ModelResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? classes = freezed,
    Object? labels = freezed,
    Object? predictedIndex = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      classes: freezed == classes
          ? _value.classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      labels: freezed == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      predictedIndex: freezed == predictedIndex
          ? _value.predictedIndex
          : predictedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModelResultImplCopyWith<$Res>
    implements $ModelResultCopyWith<$Res> {
  factory _$$ModelResultImplCopyWith(
          _$ModelResultImpl value, $Res Function(_$ModelResultImpl) then) =
      __$$ModelResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? description,
      List<double>? classes,
      List<String>? labels,
      int? predictedIndex});
}

/// @nodoc
class __$$ModelResultImplCopyWithImpl<$Res>
    extends _$ModelResultCopyWithImpl<$Res, _$ModelResultImpl>
    implements _$$ModelResultImplCopyWith<$Res> {
  __$$ModelResultImplCopyWithImpl(
      _$ModelResultImpl _value, $Res Function(_$ModelResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? classes = freezed,
    Object? labels = freezed,
    Object? predictedIndex = freezed,
  }) {
    return _then(_$ModelResultImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      classes: freezed == classes
          ? _value._classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      labels: freezed == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      predictedIndex: freezed == predictedIndex
          ? _value.predictedIndex
          : predictedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelResultImpl implements _ModelResult {
  const _$ModelResultImpl(
      {required this.title,
      required this.description,
      required final List<double>? classes,
      required final List<String>? labels,
      required this.predictedIndex})
      : _classes = classes,
        _labels = labels;

  factory _$ModelResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelResultImplFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  final List<double>? _classes;
  @override
  List<double>? get classes {
    final value = _classes;
    if (value == null) return null;
    if (_classes is EqualUnmodifiableListView) return _classes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _labels;
  @override
  List<String>? get labels {
    final value = _labels;
    if (value == null) return null;
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? predictedIndex;

  @override
  String toString() {
    return 'ModelResult(title: $title, description: $description, classes: $classes, labels: $labels, predictedIndex: $predictedIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelResultImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._classes, _classes) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.predictedIndex, predictedIndex) ||
                other.predictedIndex == predictedIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      const DeepCollectionEquality().hash(_classes),
      const DeepCollectionEquality().hash(_labels),
      predictedIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelResultImplCopyWith<_$ModelResultImpl> get copyWith =>
      __$$ModelResultImplCopyWithImpl<_$ModelResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelResultImplToJson(
      this,
    );
  }
}

abstract class _ModelResult implements ModelResult {
  const factory _ModelResult(
      {required final String? title,
      required final String? description,
      required final List<double>? classes,
      required final List<String>? labels,
      required final int? predictedIndex}) = _$ModelResultImpl;

  factory _ModelResult.fromJson(Map<String, dynamic> json) =
      _$ModelResultImpl.fromJson;

  @override
  String? get title;
  @override
  String? get description;
  @override
  List<double>? get classes;
  @override
  List<String>? get labels;
  @override
  int? get predictedIndex;
  @override
  @JsonKey(ignore: true)
  _$$ModelResultImplCopyWith<_$ModelResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
