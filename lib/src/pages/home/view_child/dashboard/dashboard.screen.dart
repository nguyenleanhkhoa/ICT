import 'package:flutter/material.dart';
import 'package:newsdailymobile/src/common/resource.dart';
import 'package:newsdailymobile/src/common/resource/image.resource.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/general_information/view/general_information.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/news/view/news.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/news_gate/view/news_gate.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/social/view/social.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/view/summary_page.screen.dart';
import 'package:newsdailymobile/src/shared/shared.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  static const String routing = '/dashboard-screen';
  @override
  Widget build(BuildContext context) {
    List<Widget> listItemGrid() {
      List<Widget> listItem = [
        Expanded(
          child: CardCustom(
              title: 'Báo Điện Tử',
              urlImage: imageDashboardNews,
              decoration: decorationHomeSmallDashboard,
              routeMonitor: NewsScreen.routing),
        ),
        Expanded(
          child: CardCustom(
              title: 'Cổng Thông Tin',
              urlImage: imageDashboardNewsGate,
              decoration: decorationHomeSmallDashboard,
              routeMonitor: NewsGateScreen.routing),
        ),
        Expanded(
          child: CardCustom(
              title: 'TTĐT Tổng Hợp',
              urlImage: imageDashboardNewsSummary,
              decoration: decorationHomeSmallDashboard,
              routeMonitor: GeneralInformationScreen.routing),
        ),
        Expanded(
          child: CardCustom(
              title: 'Mạng Xã Hội',
              urlImage: imageDashboardSocial,
              decoration: decorationHomeSmallDashboard,
              routeMonitor: DashboardSocialScreen.routing),
        ),
      ];
      return listItem;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'TRANG CHỦ',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption,
          ),
          centerTitle: true,
          backgroundColor: AppColor.headerColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: CardCustom(
                            title: 'Tổng quát',
                            urlImage: imageDashboardSummary,
                            decoration: decorationDashboard,
                            routeMonitor: SummaryPageScreen.routing),
                      ),
                    )
                  ],
                ),
              ),
              // Expanded(
              //   flex: 2,
              //   child: GridView.builder(
              //       physics: const NeverScrollableScrollPhysics(),
              //       primary: false,
              //       padding: const EdgeInsets.only(
              //           left: 15.0, right: 15.0, top: 10.0, bottom: 15.0),
              //       shrinkWrap: true,
              //       children: <Widget>[
              //         //
              //       ]),
              // ),
              Expanded(
                flex: 2,
                child: GridView.builder(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 15.0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: listItemGrid().length,
                    itemBuilder: (BuildContext ctx, index) {
                      return listItemGrid()[index];
                    }),
              )
            ],
          ),
        ));
  }
}
