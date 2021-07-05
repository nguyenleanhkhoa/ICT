import 'package:newsdailymobile/src/models/screen_model/summary_screen.model.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/news_gate/view/summary_quote_news_gate.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/news_gate/view/top_news_gate.screen.dart';

List<TabScreenModel> tabNameNewsGate = [
  const TabScreenModel(title: 'Top mới nhất', widget: TopNewsGateScreen()),
  const TabScreenModel(
      title: 'Tổng hợp - trích dẫn', widget: SummaryQuoteNewsGateScreen()),
];
