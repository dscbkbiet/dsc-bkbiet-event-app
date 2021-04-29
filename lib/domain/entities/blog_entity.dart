import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class BlogEntity extends Equatable {
  final String blogId;
  final String blogTitle;
  final String blogSubTitle;
  final String blogImage;
  final String blogLink;

  BlogEntity(
      {@required this.blogId,
      @required this.blogTitle,
      @required this.blogSubTitle,
      @required this.blogImage,
      @required this.blogLink});

  @override
  List<Object> get props => [blogId];
}
