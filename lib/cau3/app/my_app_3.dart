import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../common/style/app_style.dart';

class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Post user',
      theme: AppStyle.themeData,
      initialRoute: AppRoutes.createPost,
      routes: AppRoutes.routes,
    );
  }
}