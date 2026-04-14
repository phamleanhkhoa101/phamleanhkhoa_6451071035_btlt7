import 'package:flutter/material.dart';
import '../view/product_detail_view.dart';

class AppRoutes {
  static const String productDetail = '/';

  static Map<String, WidgetBuilder> routes = {
    productDetail: (context) => const ProductDetailView(),
  };
}