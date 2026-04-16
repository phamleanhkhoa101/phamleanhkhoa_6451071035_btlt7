import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../common/style/app_style.dart';

class MyApp4 extends StatelessWidget {
  const MyApp4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Update user info',
      theme: AppStyle.themeData,
      initialRoute: AppRoutes.updateUser,
      routes: AppRoutes.routes,
    );
  }
}