import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_result.freezed.dart';
part 'model_result.g.dart';

@freezed
class ModelResult with _$ModelResult {
  const factory ModelResult({
    required String? title,
    required String? description,
    required List<double>? classes,
    required List<String>? labels,
    required int? predictedIndex,
  }) = _ModelResult;

  factory ModelResult.fromJson(Map<String, dynamic> json) =>
      _$ModelResultFromJson(json);
}
