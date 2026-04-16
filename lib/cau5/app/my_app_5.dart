import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../common/style/app_style.dart';

class MyApp5 extends StatelessWidget {
  const MyApp5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delete Task App',
      theme: AppStyle.themeData,
      initialRoute: AppRoutes.taskList,
      routes: AppRoutes.routes,
    );
  }
}