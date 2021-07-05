import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newsdailymobile/src/domain/chart_repository/chart.repo.dart';
import 'package:newsdailymobile/src/models/models.dart';

part 'chart_event.dart';
part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  ChartBloc() : super(const ChartState());
  late ChartRepository _chartRepository;
  @override
  Stream<ChartState> mapEventToState(ChartEvent event) async* {
    if (event is GetChartByGroupWebsiteIdEvent) {
      yield* _mapGetChartByGroupWebsiteIdEventToState(event.groupWebsiteId);
    }
  }

  Stream<ChartState> _mapGetChartByGroupWebsiteIdEventToState(
      int? groupWebsiteId) async* {
    Map<String, double>? dataMap;
    BaseResponseModel<LicenseChartModel> data = await _chartRepository
        .getLicenseNotExpired(groupWebsiteId: groupWebsiteId);
    if (data.statusCode == 200) {
      dataMap!.putIfAbsent(
          'Đang hoạt động', () => double.parse(data.result!.live.toString()));
      dataMap.putIfAbsent('Ngừng hoạt động',
          () => double.parse(data.result!.notLive.toString()));
    }
    yield state.copyWith(dataMap: dataMap);
  }
}
