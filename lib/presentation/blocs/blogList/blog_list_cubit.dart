import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dsc_event/domain/entities/app_error.dart';
import 'package:dsc_event/domain/entities/blog_entity.dart';
import 'package:dsc_event/domain/entities/no_params.dart';
import 'package:dsc_event/domain/usecases/get_blog.dart';
import 'package:dsc_event/domain/usecases/get_blog_more.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'blog_list_state.dart';

class BlogListCubit extends Cubit<BlogListState> {
  final GetBlog getBlog;
  final GetMoreBlog getMoreBlog;

  BlogListCubit({required this.getBlog, required this.getMoreBlog})
      : super(BlogListInitial());

  void loadBlog() async {
    emit(BlogListLoading());
    final Either<AppError, List<BlogEntity>> eitherResponse =
        await getBlog(NoParams());

    emit(eitherResponse.fold(
      (l) => BlogListError(),
      (r) => BlogListLoaded(r),
    ));
  }

  void loadMoreBlog(List<dynamic> list) async {
    emit(BlogListLoadingMore());
    final Either<AppError, List<BlogEntity>> eitherResponse =
        await getMoreBlog(NoParams());

    emit(eitherResponse.fold(
      (l) => BlogListError(),
      (r) => BlogListLoadMore(r),
    ));
  }
}
