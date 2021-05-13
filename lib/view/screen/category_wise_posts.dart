import 'package:flutter/material.dart';
import 'package:misfit_blog_v01/model/blog_post.dart';
import 'package:misfit_blog_v01/view/component/post_list.dart';

class CategoryWisePost extends StatefulWidget {
  @override
  _CategoryWisePostState createState() => _CategoryWisePostState();
}

class _CategoryWisePostState extends State<CategoryWisePost> {
  List<BlogPost> blogPosts = [];

  @override
  Widget build(BuildContext context) {
    blogPosts = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Color(0xffEEF4FF),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("CategoryWise",style: TextStyle(
            color: Colors.black87
          ),),
        ),
        body: SafeArea(
          child: PostList(
            blogPost: blogPosts,
          ),
        ));
  }
}
