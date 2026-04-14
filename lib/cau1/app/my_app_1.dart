
import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../common/style/app_style.dart';

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User List App',
      theme: AppStyle.themeData,
      initialRoute: AppRoutes.userList,
      routes: AppRoutes.routes,
    );
  }
}
