part of 'chart_bloc.dart';

class ChartState extends Equatable {
  const ChartState({this.dataMap});
  final Map<String, double>? dataMap;

  ChartState copyWith({Map<String, double>? dataMap}) =>
      ChartState(dataMap: dataMap ?? this.dataMap);
  @override
  List<Object> get props => [];
}

// class ChartInitial extends ChartState {}
