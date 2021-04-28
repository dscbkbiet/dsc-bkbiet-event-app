import 'package:dsc_event/domain/entities/blog_entity.dart';

class Blog extends BlogEntity {
  final String blogId;
  final String blogTitle;
  final String blogImage;
  final String blogLink;

  Blog({this.blogId, this.blogTitle, this.blogImage, this.blogLink})
      : super(
            blogId: blogId,
            blogImage: blogImage,
            blogLink: blogLink,
            blogTitle: blogTitle);

  factory Blog.fromJson(Map<String, dynamic> value) {
    return Blog(
        blogId: value["blogId"],
        blogTitle: value["blogTitle"],
        blogImage: value["blogImage"],
        blogLink: value["blogLink"]);
  }

  toJson() {
    return {
      "blogId": blogId,
      "blogTitle": blogTitle,
      "blogImage": blogImage,
      "blogLink": blogLink
    };
  }
}
