import 'package:dsc_event/domain/entities/blog_entity.dart';

class Blog extends BlogEntity {
  final String blogId;
  final String blogTitle;
  final String blogSubTitle;
  final String blogImage;
  final String blogLink;

  Blog(
      {this.blogId,
      this.blogTitle,
      this.blogSubTitle,
      this.blogImage,
      this.blogLink})
      : super(
          blogId: blogId,
          blogTitle: blogTitle,
          blogSubTitle: blogSubTitle,
          blogImage: blogImage,
          blogLink: blogLink,
        );

  factory Blog.fromJson(Map<String, dynamic> value) {
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
