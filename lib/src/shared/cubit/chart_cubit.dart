import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chart_state.dart';

class ChartCubit extends Cubit<ChartProcessState> {
  ChartCubit() : super(const ChartProcessState());
  void isLoading(bool isLoading) {
    emit(ChartProcessState(isLoading: isLoading));
  }
}
