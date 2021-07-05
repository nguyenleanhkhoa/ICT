import 'package:newsdailymobile/src/models/screen_model/summary_screen.model.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_general_information/view/manage_general_infor_lookup_cert.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_general_information/view/manage_general_infor_lookup_post.screen.dart';

List<TabScreenModel> tabNameManagementGeneralInfo = [
  const TabScreenModel(
      title: 'Tra cứu giấy phép', widget: ManageGeneralInforLookupCertScreen()),
  const TabScreenModel(
      title: 'Tra cứu bài viết', widget: ManageGeneralInforLookupPostScreen()),
];
