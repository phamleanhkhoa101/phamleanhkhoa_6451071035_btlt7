import 'package:flutter/material.dart';
import 'package:phamleanhkhoa_6451070135_btlt7/cau5/view/task_list_view.dart';

class AppRoutes {
  static const String taskList = '/';

  static Map<String, WidgetBuilder> routes = {
    taskList: (context) => const TaskListView(),
  };
}