import 'package:flutter/material.dart';
import 'package:newsdailymobile/src/common/resource.dart';
import 'package:newsdailymobile/src/common/resource/image.resource.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_general_information/view/management_general_infor.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_news/view/management_news.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_news_gate/view/management_news_gate.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_social/view/management_social.screen.dart';
import 'package:newsdailymobile/src/shared/shared.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);
  static const String routing = '/report';
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Báo cáo - Thống kê',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.caption,
        ),
        centerTitle: true,
        backgroundColor: AppColor.headerColor,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          CardCustom(
              title: 'Báo điện tử',
              urlImage: imageDashboardNews,
              decoration: decorationDashboard,
              routeMonitor: ManagementNewsScreen.routing),
          CardCustom(
              title: 'Cổng thông tin',
              urlImage: imageDashboardNewsGate,
              decoration: decorationDashboard,
              routeMonitor: ManagementNewsGateScreen.routing),
          CardCustom(
              title: 'TTĐT Tổng hợp',
              urlImage: imageDashboardNewsSummary,
              decoration: decorationDashboard,
              routeMonitor: ManagementGeneralInforScreen.routing),
          CardCustom(
              title: 'Mạng xã hội',
              urlImage: imageDashboardSocial,
              decoration: decorationDashboard,
              routeMonitor: ManagementSocialScreen.routing),
        ],
      ),
    );
  }
}
