import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:misfit_blog_v01/model/blog_post.dart';

class BlogPostService {
  static const String url =
      "https://raw.githubusercontent.com/Muhaiminur/muhaiminur.github.io/master/misfitflutter.tech";

  static List<BlogPost> posts = [];

  static Future<List<BlogPost>> getPost() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> blogs = jsonDecode(response.body)["blogs"];
        for (var post in blogs) {
          posts.add(BlogPost.fromJson(post));
        }
      }
    } catch (Ex) {
      throw Exception("Couldn't Retrieve Post Right Now");
    }
    return posts;
  }
}
