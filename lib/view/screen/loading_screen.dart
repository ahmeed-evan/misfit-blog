import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';
import 'package:misfit_blog_v01/controller/blog_post_service.dart';
import 'package:misfit_blog_v01/model/blog_post.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF4FF),
      body: Center(
          child: SpinKitFadingCube(
        color: Color(0xff5282ff),
        size: 50,
      )),
    );
  }

  void getData() async {
    List<BlogPost> blogPosts = await BlogPostService.getPost();
    Navigator.pushReplacementNamed(context, "/blog", arguments: blogPosts);
  }

  void checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.pushReplacementNamed(context, '/connection');
    } else {
      getData();
    }
  }
}
