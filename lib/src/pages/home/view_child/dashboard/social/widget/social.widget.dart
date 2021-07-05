import 'package:newsdailymobile/src/models/screen_model/summary_screen.model.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/social/view/certificate_social.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/social/view/summary_quote_social.screen.dart';

List<TabScreenModel> tabNameSocial = [
  const TabScreenModel(
      title: 'Tổng hợp - trích dẫn', widget: SummaryQuoteSocialScreen()),
  const TabScreenModel(title: 'Giấy phép', widget: CertificateSocialScreen()),
];
