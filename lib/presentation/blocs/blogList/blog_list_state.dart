part of 'blog_list_cubit.dart';

@immutable
abstract class BlogListState {
  const BlogListState();

  @override
  List<Object> get props => [];
}

class BlogListInitial extends BlogListState {}

class BlogListLoading extends BlogListState {}

class BlogListLoaded extends BlogListState {
  final List<BlogEntity> blogList;

  const BlogListLoaded(this.blogList);

  @override
  List<Object> get props => [blogList];
}

class BlogListLoadingMore extends BlogListState {}

class BlogListLoadMore extends BlogListState {
  final List<BlogEntity> blogList;

  const BlogListLoadMore(this.blogList);

  @override
  List<Object> get props => [blogList];
}

class BlogListError extends BlogListState {}
