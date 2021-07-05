import 'package:equatable/equatable.dart';

class LicenseChartModel extends Equatable {
  const LicenseChartModel({this.total = 0, this.live = 0, this.notLive = 0});
  factory LicenseChartModel.fromJson(Map<String, dynamic> data) {
    return LicenseChartModel(
        total: double.parse(data['total'].toString()),
        live: double.parse(data['live'].toString()),
        notLive: double.parse(data['not_live'].toString()));
  }
  final double? total;
  final double? live;
  final double? notLive;

  @override
  List<Object?> get props => [total, live, notLive];
}
