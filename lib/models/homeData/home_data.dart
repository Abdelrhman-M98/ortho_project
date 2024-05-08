import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ortho/models/sendScan/analysis_data.dart';
import 'package:ortho/models/user/user.dart';

part 'home_data.freezed.dart';
part 'home_data.g.dart'; // Generated file

@freezed
class HomeData with _$HomeData {
  const factory HomeData({
    required List<AnalysisData> recentScans,
    required User user, // Add user field
  }) = _HomeData;

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
}
