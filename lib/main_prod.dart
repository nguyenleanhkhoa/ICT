import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:newsdailymobile/app.dart';
import 'package:newsdailymobile/src/bloc/app_bar_bloc/app_bar_bloc.dart';
import 'package:newsdailymobile/src/bloc/loading_bloc/loading_bloc.dart';
import 'package:newsdailymobile/src/bloc/news_link_bloc/news_link_bloc.dart';
import 'package:newsdailymobile/src/config/flavor_config.dart';
import 'package:newsdailymobile/src/config/hive_constant.dart';
import 'package:newsdailymobile/src/config/palette.dart';
import 'package:newsdailymobile/src/domain/repository.dart';
import 'package:newsdailymobile/src/models/models.dart';
import 'package:newsdailymobile/src/pages/home/view/home.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/dashboard.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/general_information/view/general_information.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/news/view/news.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/news_gate/view/news_gate.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/social/view/social.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/cubit/drop_down_cubit/drop_down_cubit.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/summary/view/summary_page.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/report/report.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_general_information/view/management_general_infor.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_news/view/management_news.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_news_gate/view/management_news_gate.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_social/view/management_social.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/tool_management.screen.dart';
import 'package:newsdailymobile/src/pages/login/view/login.screen.dart';
import 'package:newsdailymobile/src/shared/cubit/chart_cubit.dart';
import 'package:path_provider/path_provider.dart' as path;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  final Directory directory = await path.getApplicationDocumentsDirectory();
  //init Hive
  Hive
    ..init(directory.path)
    ..registerAdapter(UserAdapter());

  await Hive.openBox(box);
  await Hive.openBox(boxAuth);
  ConfigFlavor.instanceConfig();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late LinkRepository linkRepository;
  late NewspaperRepository newspaperRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBarBloc>(
          create: (context) => AppBarBloc(),
        ),
        BlocProvider<NewsLinkBloc>(
            create: (context) => NewsLinkBloc(
                linkRepository: LinkRepository(),
                newspaperRepository: NewspaperRepository())),
        BlocProvider<DropdownCubit>(
          create: (BuildContext ctx) => DropdownCubit(),
        ),
        BlocProvider<ChartCubit>(
          create: (BuildContext ctx) => ChartCubit(),
        ),
        BlocProvider<LoadingBloc>(
          create: (BuildContext ctx) => LoadingBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Palatte.customTheme(),
        home: App(),
        initialRoute: LoginScreen.routing,
        routes: {
          LoginScreen.routing: (ctx) => const LoginScreen(),
          HomeScreen.routing: (ctx) => const HomeScreen(),
          ToolManagementScreen.routing: (ctx) => const ToolManagementScreen(),
          DashBoardScreen.routing: (ctx) => const DashBoardScreen(),
          ReportScreen.routing: (ctx) => const ReportScreen(),
          SummaryPageScreen.routing: (ctx) => const SummaryPageScreen(),
          NewsScreen.routing: (ctx) => const NewsScreen(),
          NewsGateScreen.routing: (ctx) => const NewsGateScreen(),
          GeneralInformationScreen.routing: (ctx) =>
              const GeneralInformationScreen(),
          DashboardSocialScreen.routing: (ctx) => const DashboardSocialScreen(),
          ManagementGeneralInforScreen.routing: (ctx) =>
              const ManagementGeneralInforScreen(),
          ManagementNewsScreen.routing: (ctx) => const ManagementNewsScreen(),
          ManagementNewsGateScreen.routing: (ctx) =>
              const ManagementNewsGateScreen(),
          ManagementSocialScreen.routing: (ctx) =>
              const ManagementSocialScreen(),
        },
      ),
    );
  }
}
