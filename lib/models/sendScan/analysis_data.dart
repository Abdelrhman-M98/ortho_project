// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ortho/models/model_result/model_result.dart';

part 'analysis_data.freezed.dart';
part 'analysis_data.g.dart';

@freezed
class AnalysisData with _$AnalysisData {
  const factory AnalysisData({
    required String userId,
    required List<ModelResult> data,
    required int id,
    required String image,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
  }) = _AnalysisData;

  factory AnalysisData.fromJson(Map<String, dynamic> json) =>
      _$AnalysisDataFromJson(json);
}
