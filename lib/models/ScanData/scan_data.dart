import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_data.freezed.dart';
part 'scan_data.g.dart'; // Generated file

@freezed
class ScanData with _$ScanData {
  const factory ScanData({
    required String id,
    required String imageBefore,
    required String imageAfter,
    required ScanStatus scanStatus,
    required DateTime scanTime,
  }) = _ScanData;

  factory ScanData.fromJson(Map<String, dynamic> json) =>
      _$ScanDataFromJson(json);
}

enum ScanStatus { completed, failed, pending }
