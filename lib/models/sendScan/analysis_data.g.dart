// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalysisDataImpl _$$AnalysisDataImplFromJson(Map<String, dynamic> json) =>
    _$AnalysisDataImpl(
      userId: json['userId'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ModelResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AnalysisDataImplToJson(_$AnalysisDataImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'data': instance.data,
      'id': instance.id,
      'image': instance.image,
      'createdAt': instance.createdAt.toIso8601String(),
    };
