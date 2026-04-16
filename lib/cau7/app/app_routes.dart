import 'package:flutter/material.dart';
import 'package:phamleanhkhoa_6451070135_btlt7/cau7/view/news_list_view.dart';

class AppRoutes {
  static const String newsList = '/';

  static Map<String, WidgetBuilder> routes = {
    newsList: (context) => const NewsListView(),
  };
}