import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsdailymobile/src/bloc/chart_bloc/chart_bloc.dart';
import 'package:newsdailymobile/src/common/resource.dart';
import 'package:newsdailymobile/src/domain/chart_repository/chart.repo.dart';
import 'package:newsdailymobile/src/models/models.dart';
import 'package:newsdailymobile/src/shared/cubit/chart_cubit.dart';
import 'package:pie_chart/pie_chart.dart';

enum Chart { license }

class ChartWidget extends StatefulWidget {
  final Widget? titleChart;
  final Chart? chart;
  final Map<String, double>? dataMap;
  final int? groupWebsiteId;
  const ChartWidget(
      {Key? key,
      this.titleChart,
      this.chart,
      this.dataMap,
      this.groupWebsiteId})
      : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  late ChartRepository _chartRepository;
  Map<String, double>? dataMap = {};
  Future<void> getLicenseWebsiteNotExpired(int groupWebsiteId) async {
    final BaseResponseModel<LicenseChartModel> data = await _chartRepository
        .getLicenseNotExpired(groupWebsiteId: groupWebsiteId);
    if (data.statusCode == 200) {
      dataMap!.putIfAbsent(
          'Đang hoạt động', () => double.parse(data.result!.live.toString()));
      dataMap!.putIfAbsent('Ngừng hoạt động',
          () => double.parse(data.result!.notLive.toString()));
      context.read<ChartCubit>().isLoading(false);
    }
  }

  @override
  void initState() {
    // getLicenseWebsiteNotExpired(widget.groupWebsiteId!);
    context.read<ChartBloc>().add(
        GetChartByGroupWebsiteIdEvent(groupWebsiteId: widget.groupWebsiteId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ChartBloc, ChartState>(
          builder: (context, state) {
            return piechartCustom(context, dataMap!);
          },
        ),
        widget.titleChart!,
      ],
    );
  }

  Widget piechartCustom(BuildContext context, Map<String, double> dataMap) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: AppColor.listColorPieChart,
      initialAngleInDegree: 0,
      // chartType: ChartType.ring,
      ringStrokeWidth: 32,
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        // legendShape: _BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.normal,
        ),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
      ),
    );
  }
}
