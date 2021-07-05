// To parse this JSON data, do
//
//     final licenseChart = licenseChartFromJson(jsonString);

import 'dart:convert';

String licenseChartToJson(List<LicenseChartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LicenseChartModel {
  LicenseChartModel({
    this.total,
    this.live,
    this.notLive,
  });

  int? total;
  int? live;
  int? notLive;

  LicenseChartModel copyWith({
    int? total,
    int? live,
    int? notLive,
  }) =>
      LicenseChartModel(
        total: total ?? this.total,
        live: live ?? this.live,
        notLive: notLive ?? this.notLive,
      );

  factory LicenseChartModel.fromJson(Map<String, dynamic> json) =>
      LicenseChartModel(
        total: json["total"] as int,
        live: json["live"] as int,
        notLive: json["not_live"] as int,
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "live": live,
        "not_live": notLive,
      };
}
