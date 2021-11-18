import 'package:dsc_event/domain/entities/blog_entity.dart';

class Blog extends BlogEntity {
  final String blogId;
  final String blogTitle;
  final String blogSubTitle;
  final String blogImage;
  final String blogLink;

  Blog(
      {required this.blogId,
      required this.blogTitle,
      required this.blogSubTitle,
      required this.blogImage,
      required this.blogLink})
      : super(
          blogId: blogId,
          blogTitle: blogTitle,
          blogSubTitle: blogSubTitle,
          blogImage: blogImage,
          blogLink: blogLink,
        );

  factory Blog.fromJson(Map<dynamic, dynamic> value) {
    return Blog(
        blogId: value["blogId"],
        blogTitle: value["blogTitle"],
        blogSubTitle: value["blogSubTitle"],
        blogImage: value["blogImage"],
        blogLink: value["blogLink"]);
  }

  toJson() {
    return {
      "blogId": blogId,
      "blogTitle": blogTitle,
      "blogSubTitle": blogSubTitle,
      "blogImage": blogImage,
      "blogLink": blogLink
    };
  }
}
