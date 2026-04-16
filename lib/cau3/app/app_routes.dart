import 'package:flutter/material.dart';
import 'package:phamleanhkhoa_6451070135_btlt7/cau3/view/create_post_view.dart';

class AppRoutes {
  static const String createPost = '/';

  static Map<String, WidgetBuilder> routes = {
    createPost: (context) => const CreatePostView(),
  };
}