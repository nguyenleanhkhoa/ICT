import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsdailymobile/src/bloc/app_bar_bloc/app_bar_bloc.dart';
import 'package:newsdailymobile/src/common/Utils/utils_common.dart';
import 'package:newsdailymobile/src/common/resource.dart';
import 'package:newsdailymobile/src/domain/repository.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/widget/summary.widget.dart';

import 'package:newsdailymobile/src/shared/shared.dart';

class SummaryPageScreen extends StatefulWidget {
  const SummaryPageScreen({Key? key}) : super(key: key);

  static const String routing = '/home-dashboard/summary';

  @override
  _SummaryPageScreenState createState() => _SummaryPageScreenState();
}

class _SummaryPageScreenState extends State<SummaryPageScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late LinkRepository linkRepo;
  late NewspaperRepository newspaperRepo;
  late TabController tabController;
  List<Widget> listTab = [];
  void _handleTitleAppBar(int index) {
    context
        .read<AppBarBloc>()
        .add(HandleChangeTitleAppBarEvent(title: tabName[index].title));
  }

  @override
  void initState() {
    // UtilsCommon.showProcess(context);
    listTab.addAll(tabName.map((e) => e.widget));
    context
        .read<AppBarBloc>()
        .add(HandleChangeTitleAppBarEvent(title: tabName[0].title));
    tabController = TabController(length: tabName.length, vsync: this);
    tabController.addListener(() {
      _handleTitleAppBar(tabController.index);
    });
    linkRepo = LinkRepository();
    newspaperRepo = NewspaperRepository();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return DefaultTabController(
      key: scaffoldKey,
      length: tabName.length,
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
                          isScrollable: true,
                          labelColor: AppColor.titleColorBar,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: AppColor.titleColorBar,
                          tabs: renderTabBar(context, tabName)),
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

  @override
  bool get wantKeepAlive => true;
}
