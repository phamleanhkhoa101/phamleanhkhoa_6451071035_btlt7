import 'package:flutter/material.dart';
import 'package:phamleanhkhoa_6451070135_btlt7/cau5/view/task_list_view.dart';
import 'package:phamleanhkhoa_6451070135_btlt7/cau6/view/search_product_view.dart';

class AppRoutes {
  static const String searchProduct = '/';

  static Map<String, WidgetBuilder> routes = {
    searchProduct: (context) => const SearchProductView(),
  };
}