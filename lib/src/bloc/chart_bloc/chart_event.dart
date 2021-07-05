part of 'chart_bloc.dart';

abstract class ChartEvent extends Equatable {
  const ChartEvent();

  @override
  List<Object> get props => [];
}

class GetChartByGroupWebsiteIdEvent extends ChartEvent {
  const GetChartByGroupWebsiteIdEvent({this.groupWebsiteId});

  final int? groupWebsiteId;
}
