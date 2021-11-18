import 'package:dsc_event/di/get_it.dart';
import 'package:dsc_event/domain/entities/blog_entity.dart';
import 'package:dsc_event/presentation/blocs/blogList/blog_list_cubit.dart';
import 'package:dsc_event/presentation/journeys/blogScreen/plog_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  late BlogListCubit _blogListCubit;
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
    _blogListCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: _blogListCubit,
        builder: (context, state) {
          if (state is BlogListInitial ||
              state is BlogListLoading && _blogList.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BlogListLoaded) {
            if (_blogList.isEmpty) _blogList.addAll(state.blogList);
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
