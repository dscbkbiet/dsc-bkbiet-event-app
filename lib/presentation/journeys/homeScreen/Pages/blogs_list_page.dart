import 'dart:async';

import 'package:dsc_event/common/extensions/ext.dart';
import 'package:dsc_event/di/get_it.dart';
import 'package:dsc_event/domain/entities/blog_entity.dart';
import 'package:dsc_event/presentation/blocs/blogList/blog_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  BlogListCubit _blogListCubit;
  List<BlogEntity> _blogList = List.empty(growable: true);
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _blogListCubit = getItInstance<BlogListCubit>();
    _blogListCubit.loadBlog();
  }

  @override
  void dispose() {
    _blogListCubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        cubit: _blogListCubit,
        builder: (context, state) {
          if (state is BlogListInitial ||
              state is BlogListLoading && _blogList.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BlogListLoaded) {
            _blogList.addAll(state.blogList);
          } else if (state is BlogListLoadingMore) {
            isLoading = true;
          } else if (state is BlogListLoadMore) {
            isLoading = false;
            if (state.blogList.isNotEmpty) {
              _blogList.addAll(state.blogList);
            }
          } else if (state is BlogListError) {
            return Container();
          }
          return BlogList(
            onComplete: () {
              _blogListCubit.loadMoreBlog(_blogList);
            },
            isLoading: isLoading,
            list: _blogList,
          );
        },
      ),
    );
  }
}

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

class BlogCard extends StatelessWidget {
  const BlogCard({Key key, this.blogImageLink, this.blogTitle, this.blogLink})
      : super(key: key);
  final String blogImageLink;
  final String blogTitle;
  final String blogLink;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.network(blogImageLink),
              flex: 4,
            ),
            Expanded(
              child: Text(blogTitle.intelliTrim()),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
