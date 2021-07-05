import 'package:flutter/material.dart';
import 'package:newsdailymobile/src/config/global_constant.dart';
import 'package:newsdailymobile/src/domain/chart_repository/chart.repo.dart';
import 'package:newsdailymobile/src/models/models.dart';
import 'package:newsdailymobile/src/shared/cubit/chart_cubit.dart';
import 'package:newsdailymobile/src/shared/widget/chart.widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryCertificateExpiredScreen extends StatefulWidget {
  const SummaryCertificateExpiredScreen({Key? key, this.groupId})
      : super(key: key);
  final int? groupId;
  @override
  _SummaryCertificateExpiredScreenState createState() =>
      _SummaryCertificateExpiredScreenState();
}

class _SummaryCertificateExpiredScreenState
    extends State<SummaryCertificateExpiredScreen>
    with AutomaticKeepAliveClientMixin {
  late ChartRepository _chartRepository;
  Map<String, double>? dataMap = {};
  // Future<void> getLicenseWebsiteNotExpired() async {
  //   final BaseResponseModel<LicenseChartModel> data =
  //       await _chartRepository.getLicenseNotExpired();
  //   if (data.statusCode == 200) {
  //     dataMap!.putIfAbsent(
  //         'Đang hoạt động', () => double.parse(data.result!.live.toString()));
  //     dataMap!.putIfAbsent('Ngừng hoạt động',
  //         () => double.parse(data.result!.notLive.toString()));
  //     context.read<ChartCubit>().isLoading(false);
  //   }
  // }

  @override
  void initState() {
    context.read<ChartCubit>().isLoading(true);
    _chartRepository = ChartRepository();
    // getLicenseWebsiteNotExpired();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ChartCubit, ChartProcessState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const SizedBox();
        }
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChartWidget(
                groupWebsiteId: GroupWebsiteId.baodientu,
                titleChart: Column(
                  children: const [
                    Text('Biểu đồ thống kê trạng thái hoạt động'),
                    Text('Báo điện tử',
                        style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                ),
                chart: Chart.license,
                dataMap: dataMap,
              ),
              ChartWidget(
                groupWebsiteId: GroupWebsiteId.congthongtindtth,
                titleChart: Column(
                  children: const [
                    Text('Biểu đồ thống kê trạng thái hoạt động'),
                    Text('TTĐT tổng hợp',
                        style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                ),
                chart: Chart.license,
                dataMap: dataMap,
              ),
              ChartWidget(
                groupWebsiteId: GroupWebsiteId.mangxahoi,
                titleChart: Column(
                  children: const [
                    Text('Biểu đồ thống kê trạng thái hoạt động'),
                    Text(' Mạng Xã Hội',
                        style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                ),
                chart: Chart.license,
                dataMap: dataMap,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
