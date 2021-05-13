import 'package:flutter/material.dart';
import 'package:misfit_blog_v01/view/screen/blog_overview.dart';
import 'package:misfit_blog_v01/view/screen/category_wise_posts.dart';
import 'package:misfit_blog_v01/view/screen/connection_status.dart';
import 'package:misfit_blog_v01/view/screen/loading_screen.dart';
import 'package:misfit_blog_v01/view/screen/post_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Roboto"),
        initialRoute: '/',
        routes: {
          '/': (context) => Loading(),
          '/connection': (context) => ConnectionStatus(),
          '/blog': (context) => BlogOverview(),
          '/post': (context) => Post(),
          '/category-wise': (context) => CategoryWisePost(),
        }
    );
  }
}
