// To parse this JSON data, do
//
//     final blogPost = blogPostFromJson(jsonString);

import 'dart:convert';

BlogPost blogPostFromJson(String str) => BlogPost.fromJson(json.decode(str));

String blogPostToJson(BlogPost data) => json.encode(data.toJson());

class BlogPost {
  BlogPost({
    this.id,
    this.title,
    this.description,
    this.coverPhoto,
    this.categories,
    this.author,
  });

  int id;
  String title;
  String description;
  String coverPhoto;
  List<String> categories;
  Author author;

  factory BlogPost.fromJson(Map<String, dynamic> json) => BlogPost(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        coverPhoto: json["cover_photo"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        author: Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "cover_photo": coverPhoto,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "author": author.toJson(),
      };

  @override
  String toString() {
    return "(${this.title},${this.description},${this.id},${this.categories},${this.author},${this.coverPhoto},)";
  }
}

class Author {
  Author({
    this.id,
    this.name,
    this.avatar,
    this.profession,
  });

  int id;
  String name;
  String avatar;
  String profession;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        profession: json["profession"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "profession": profession,
      };
}
