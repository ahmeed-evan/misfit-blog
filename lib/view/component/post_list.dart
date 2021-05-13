import 'package:flutter/material.dart';
import 'package:misfit_blog_v01/model/blog_post.dart';

class PostList extends StatelessWidget {
  List<BlogPost> blogPost;

  PostList({this.blogPost});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: blogPost.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Color(0xffFCFCFC),
            clipBehavior: Clip.antiAlias,
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/post",
                    arguments: this.blogPost[index]);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Ink.image(
                        image:
                            NetworkImage("${this.blogPost[index].coverPhoto}"),
                        fit: BoxFit.fitWidth,
                        height: 200,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Text(
                          '${this.blogPost[index].title}',
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, bottom: 30, top: 20),
                    child:
                        Text("Description: ${this.blogPost[index].description}",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87,
                            )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
