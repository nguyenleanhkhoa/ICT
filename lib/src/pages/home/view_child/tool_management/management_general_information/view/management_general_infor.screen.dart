import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsdailymobile/src/bloc/app_bar_bloc/app_bar_bloc.dart';
import 'package:newsdailymobile/src/common/resource.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_general_information/widget/management_general_infor.widget.dart';
import 'package:newsdailymobile/src/shared/shared.dart';

class ManagementGeneralInforScreen extends StatefulWidget {
  const ManagementGeneralInforScreen({Key? key}) : super(key: key);
  static const String routing = '/tool-mangement/general-infor';
  @override
  _ManagementGeneralInforScreenState createState() =>
      _ManagementGeneralInforScreenState();
}

class _ManagementGeneralInforScreenState
    extends State<ManagementGeneralInforScreen> with TickerProviderStateMixin {
  late TabController tabController;
  List<Widget> listTab = [];
  void _handleTitleAppBar(int index) {
    context.read<AppBarBloc>().add(HandleChangeTitleAppBarEvent(
        title: tabNameManagementGeneralInfo[index].title));
  }

  @override
  void initState() {
    listTab.addAll(tabNameManagementGeneralInfo.map((e) => e.widget));
    context.read<AppBarBloc>().add(HandleChangeTitleAppBarEvent(
        title: tabNameManagementGeneralInfo[0].title));
    tabController =
        TabController(length: tabNameManagementGeneralInfo.length, vsync: this);
    tabController.addListener(() {
      _handleTitleAppBar(tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabNameManagementGeneralInfo.length,
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
                          tabs: renderTabBar(
                              context, tabNameManagementGeneralInfo)),
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
