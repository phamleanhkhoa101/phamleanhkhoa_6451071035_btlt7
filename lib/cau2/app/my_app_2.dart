import 'package:flutter/material.dart';
import 'package:phamleanhkhoa_6451070135_btlt7/cau2/app/app_routes.dart';
import 'package:phamleanhkhoa_6451070135_btlt7/cau2/common/style/app_style.dart';

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Detail App',
      theme: AppStyle.themeData,
      initialRoute: AppRoutes.productDetail,
      routes: AppRoutes.routes,
    );
  }
}