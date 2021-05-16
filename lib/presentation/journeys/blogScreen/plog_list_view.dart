import 'dart:async';

import 'package:dsc_event/domain/entities/blog_entity.dart';
import 'package:dsc_event/presentation/journeys/blogScreen/blog_card.dart';
import 'package:flutter/material.dart';

class BlogList extends StatefulWidget {
  const BlogList({Key key, this.onComplete, this.list, this.isLoading})
      : super(key: key);
  final VoidCallback onComplete;
  final List<BlogEntity> list;
  final bool isLoading;

  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  ScrollController _controllerBlogList = ScrollController();

  @override
  void initState() {
    _controllerBlogList.addListener(_scrollListenerBlog);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerBlogList?.dispose();
  }

  void _scrollListenerBlog() async {
    if (_controllerBlogList.offset >=
            _controllerBlogList.position.maxScrollExtent &&
        !_controllerBlogList.position.outOfRange) {
      widget.onComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controllerBlogList,
      itemCount: widget.list.length + (widget.isLoading ? 1 : 0),
      itemBuilder: (BuildContext context, int index) {
        if (index < widget.list.length) {
          return BlogCard(
            blogImageLink: widget.list[index].blogImage,
            blogLink: widget.list[index].blogLink,
            blogSubTitle: widget.list[index].blogSubTitle,
            blogTitle: widget.list[index].blogTitle,
          );
        } else {
          Timer(Duration(milliseconds: 30), () {
            _controllerBlogList
                .jumpTo(_controllerBlogList.position.maxScrollExtent);
          });
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
