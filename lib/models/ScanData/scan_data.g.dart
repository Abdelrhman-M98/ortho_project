// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScanDataImpl _$$ScanDataImplFromJson(Map<String, dynamic> json) =>
    _$ScanDataImpl(
      id: json['id'] as String,
      imageBefore: json['imageBefore'] as String,
      imageAfter: json['imageAfter'] as String,
      scanStatus: $enumDecode(_$ScanStatusEnumMap, json['scanStatus']),
      scanTime: DateTime.parse(json['scanTime'] as String),
    );

Map<String, dynamic> _$$ScanDataImplToJson(_$ScanDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageBefore': instance.imageBefore,
      'imageAfter': instance.imageAfter,
      'scanStatus': _$ScanStatusEnumMap[instance.scanStatus]!,
      'scanTime': instance.scanTime.toIso8601String(),
    };

const _$ScanStatusEnumMap = {
  ScanStatus.completed: 'completed',
  ScanStatus.failed: 'failed',
  ScanStatus.pending: 'pending',
};
