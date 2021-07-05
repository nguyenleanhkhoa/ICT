import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsdailymobile/src/bloc/app_bar_bloc/app_bar_bloc.dart';
import 'package:newsdailymobile/src/common/resource.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_news_gate/widget/management_news_gate.widget.dart';
import 'package:newsdailymobile/src/shared/shared.dart';

class ManagementNewsGateScreen extends StatefulWidget {
  const ManagementNewsGateScreen({Key? key}) : super(key: key);
  static const String routing = '/tool-mangement/news-gate';

  @override
  _ManagementNewsGateScreenState createState() =>
      _ManagementNewsGateScreenState();
}

class _ManagementNewsGateScreenState extends State<ManagementNewsGateScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<Widget> listTab = [];
  void _handleTitleAppBar(int index) {
    context.read<AppBarBloc>().add(HandleChangeTitleAppBarEvent(
        title: tabNameManagementNewsGate[index].title));
  }

  @override
  void initState() {
    listTab.addAll(tabNameManagementNewsGate.map((e) => e.widget));
    context.read<AppBarBloc>().add(HandleChangeTitleAppBarEvent(
        title: tabNameManagementNewsGate[0].title));
    tabController =
        TabController(length: tabNameManagementNewsGate.length, vsync: this);
    tabController.addListener(() {
      _handleTitleAppBar(tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabNameManagementNewsGate.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: BlocBuilder<AppBarBloc, AppBarState>(
            builder: (context, state) {
              return AppBar(
                centerTitle: true,
                leading: Row(
                  children: [
                    const Icon(Icons.chevron_left),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Trở về'))
                  ],
                ),
                leadingWidth: 100.0,
                title: Text(
                  state.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
                bottom: PreferredSize(
                    child: Container(
                      color: Colors.white,
                      child: TabBar(
                          controller: tabController,
                          isScrollable: false,
                          labelColor: AppColor.titleColorBar,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: AppColor.titleColorBar,
                          tabs:
                              renderTabBar(context, tabNameManagementNewsGate)),
                    ),
                    preferredSize: const Size.fromHeight(30.0)),
              );
            },
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: listTab,
        ),
      ),
    );
  }
}
