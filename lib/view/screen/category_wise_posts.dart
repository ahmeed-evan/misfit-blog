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
      body: SafeArea(
          child: PostList(
        blogPost: blogPosts,
      )),
    );
  }
}
