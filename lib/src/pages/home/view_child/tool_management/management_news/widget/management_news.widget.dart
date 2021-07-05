import 'package:newsdailymobile/src/models/screen_model/summary_screen.model.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_news/view/management_lookup_cert.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_news/view/management_lookup_post.screen.dart';

List<TabScreenModel> tabNameManagementNews = [
  const TabScreenModel(
      title: 'Tra cứu giấy phép', widget: ManagementLookupCertScreen()),
  const TabScreenModel(
      title: 'Tra cứu bài viết', widget: ManagementLookupPostScreen()),
];
