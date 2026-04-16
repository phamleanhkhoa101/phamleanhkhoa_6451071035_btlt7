import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../common/style/app_style.dart';

class MyApp7 extends StatelessWidget {
  const MyApp7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pull To Refresh App',
      theme: AppStyle.themeData,
      initialRoute: AppRoutes.newsList,
      routes: AppRoutes.routes,
    );
  }
}