import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misfit_blog_v01/model/blog_post.dart';


class Post extends StatelessWidget {
  BlogPost blogPost;

  @override
  Widget build(BuildContext context) {
    blogPost = ModalRoute.of(context).settings.arguments;
    print(blogPost);

    return Scaffold(
      backgroundColor: Color(0xffEEF4FF),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('${this.blogPost.coverPhoto}'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios_sharp,
                              color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        this.blogPost.title,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(this.blogPost.author.avatar),
                            maxRadius: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(this.blogPost.author.name),
                              SizedBox(
                                height: 8,
                              ),
                              Text(this.blogPost.author.profession)
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        this.blogPost.description,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
