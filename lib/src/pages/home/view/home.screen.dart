import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsdailymobile/src/common/resource/color.resource.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/dashboard.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/report/report.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/tool_management.screen.dart';
import 'package:newsdailymobile/src/shared/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routing = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            child: const Icon(Icons.chevron_left, color: Colors.white)),
        title: Text(
          'SỞ THÔNG TIN VÀ TRUYỀN THÔNG THÀNH PHỐ HỒ CHÍ MINH',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.caption,
        ),
        centerTitle: true,
        backgroundColor: AppColor.headerColor,
      ),
      body: Container(
          // height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: CardCustom(
                      title: 'DASHBOARD',
                      urlImage: 'assets/icons/dashboard.png',
                      decoration: decorationDashboard,
                      routeMonitor: DashBoardScreen.routing),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: CardCustom(
                      title: 'CÔNG CỤ QUẢN LÝ',
                      urlImage: 'assets/icons/tool-quan-ly.png',
                      decoration: decorationToolDashboard,
                      routeMonitor: ToolManagementScreen.routing),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, right: 15, bottom: 15),
                  child: CardCustom(
                      title: 'BÁO CÁO - THỐNG KÊ',
                      urlImage: 'assets/icons/report.png',
                      decoration: decorationReportDashboard,
                      routeMonitor: ReportScreen.routing),
                ))
              ],
            ),
          )),
    );
  }
}
