import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misfit_blog_v01/model/blog_post.dart';
import 'package:misfit_blog_v01/view/component/post_list.dart';

class BlogOverview extends StatefulWidget {
  @override
  _BlogOverviewState createState() => _BlogOverviewState();
}

class _BlogOverviewState extends State<BlogOverview> {
  List<BlogPost> allPosts = [];
  Set<String> sortedCategories = new Set();

  @override
  Widget build(BuildContext context) {
    allPosts = ModalRoute.of(context).settings.arguments;
    for (var post in allPosts) {
      for (var category in post.categories) {
        sortedCategories.add(category);
      }
    }
    List<String> categories = sortedCategories.toList();

    return Scaffold(
      backgroundColor: Color(0xffEEF4FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What are you interested today?',
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                  height: 50.0,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) => Card(
                      color: Colors.white24,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/category-wise",
                              arguments: allPosts.where((post) {
                                return post.categories
                                    .contains(categories[index]);
                              }).toList());
                        },
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(child: Text("${categories[index]}"))),
                      ),
                    ),
                  )),
              SizedBox(
                height: 16,
              ),
              Text(
                ' Trending',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 8,
              ),
              PostList(
                blogPost: allPosts,
              )
            ],
          ),
        ),
      ),
    );
  }
}
