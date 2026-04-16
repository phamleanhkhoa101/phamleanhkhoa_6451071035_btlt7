import 'package:flutter/material.dart';
import 'package:phamleanhkhoa_6451070135_btlt7/cau4/view/update_user_view.dart';

class AppRoutes {
  static const String updateUser = '/';

  static Map<String, WidgetBuilder> routes = {
    updateUser: (context) => const UpdateUserView(),
  };
}