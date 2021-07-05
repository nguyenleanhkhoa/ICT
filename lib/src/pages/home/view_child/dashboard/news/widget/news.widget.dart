import 'package:newsdailymobile/src/models/screen_model/summary_screen.model.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/news/view/summary_%20quote.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/news/view/top_news.screen.dart';
import 'package:newsdailymobile/src/pages/home/view_child/dashboard/news/view/top_news_source.screen.dart';

List<TabScreenModel> tabNameNews = [
  const TabScreenModel(title: 'Top mới nhất', widget: TopNewsScreen()),
  const TabScreenModel(
      title: 'Tổng hợp - trích dẫn', widget: SummaryQuoteScreen()),
  const TabScreenModel(title: 'Top nguồn tin', widget: TopNewsSourceScreen()),
];
