import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../common/style/app_style.dart';

class MyApp6 extends StatelessWidget {
  const MyApp6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Product App',
      theme: AppStyle.themeData,
      initialRoute: AppRoutes.searchProduct,
      routes: AppRoutes.routes,
    );
  }
}