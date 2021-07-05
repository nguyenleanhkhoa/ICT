import 'package:newsdailymobile/src/models/screen_model/summary_screen.model.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/general_information/view/certificate_general_information.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/general_information/view/summary_quote_general_infor.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/general_information/view/top_general_infor.screen.dart';

List<TabScreenModel> tabNameGeneralInfo = [
  const TabScreenModel(
      title: 'Top mới nhất', widget: TopGeneralInformationScreen()),
  const TabScreenModel(
      title: 'Tổng hợp - trích dẫn',
      widget: SummaryQuoteGeneralInformationScreen()),
  const TabScreenModel(
      title: 'Giấy phép', widget: CertificateGeneralInformationScreen()),
];
