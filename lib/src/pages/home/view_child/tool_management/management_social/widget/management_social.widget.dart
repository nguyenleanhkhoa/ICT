import 'package:newsdailymobile/src/models/screen_model/summary_screen.model.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_social/view/mangement_social_lookup_cert.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/tool_management/management_social/view/mangement_social_lookup_post.screen.dart';

List<TabScreenModel> tabNameManagementSocial = [
  const TabScreenModel(
      title: 'Tra cứu giấy phép', widget: ManagementSocialLookupCertScreen()),
  const TabScreenModel(
      title: 'Tra cứu bài viết', widget: ManagementSocialLookupPostScreen()),
];
