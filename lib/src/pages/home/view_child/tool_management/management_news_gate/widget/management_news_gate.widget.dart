import 'package:newsdailymobile/src/models/screen_model/summary_screen.model.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_news_gate/view/manage_news_gate_lookup_cert.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_news_gate/view/manage_news_gate_lookup_post.screen.dart';

List<TabScreenModel> tabNameManagementNewsGate = [
  const TabScreenModel(
      title: 'Tra cứu giấy phép', widget: ManageNewsGateLookupCertScreen()),
  const TabScreenModel(
      title: 'Tra cứu bài viết', widget: ManageNewsGateLookupPostScreen()),
];
