part of 'chart_cubit.dart';

class ChartProcessState extends Equatable {
  const ChartProcessState({this.isLoading = false});
  final bool isLoading;

  @override
  List<Object> get props => [isLoading];
}
