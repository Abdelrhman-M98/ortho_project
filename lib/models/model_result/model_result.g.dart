// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModelResultImpl _$$ModelResultImplFromJson(Map<String, dynamic> json) =>
    _$ModelResultImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      predictedIndex: (json['predictedIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ModelResultImplToJson(_$ModelResultImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'classes': instance.classes,
      'labels': instance.labels,
      'predictedIndex': instance.predictedIndex,
    };
