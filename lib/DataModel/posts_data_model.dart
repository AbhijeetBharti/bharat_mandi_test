import 'dart:convert';

PostsDataModel postsDataModelFromJson(String str) =>
    PostsDataModel.fromJson(json.decode(str));

class PostsDataModel {
  List<Post>? posts;
  int? total;
  int? skip;
  int? limit;

  PostsDataModel({
    this.posts,
    this.total,
    this.skip,
    this.limit,
  });

  factory PostsDataModel.fromJson(Map<String, dynamic> json) => PostsDataModel(
        posts: json["posts"] == null
            ? []
            : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );
}

class Post {
  int? id;
  String? title;
  String? body;
  int? userId;
  List<Tag>? tags;
  int? reactions;

  Post({
    this.id,
    this.title,
    this.body,
    this.userId,
    this.tags,
    this.reactions,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => tagValues.map[x]!)),
        reactions: json["reactions"],
      );
}

enum Tag {
  AMERICAN,
  CLASSIC,
  CRIME,
  ENGLISH,
  FICTION,
  FRENCH,
  HISTORY,
  LOVE,
  MAGICAL,
  MYSTERY
}

final tagValues = EnumValues({
  "american": Tag.AMERICAN,
  "classic": Tag.CLASSIC,
  "crime": Tag.CRIME,
  "english": Tag.ENGLISH,
  "fiction": Tag.FICTION,
  "french": Tag.FRENCH,
  "history": Tag.HISTORY,
  "love": Tag.LOVE,
  "magical": Tag.MAGICAL,
  "mystery": Tag.MYSTERY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
