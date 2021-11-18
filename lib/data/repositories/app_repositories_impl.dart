import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dsc_event/data/data_sources/remote_data_source.dart';
import 'package:dsc_event/domain/entities/app_error.dart';
import 'package:dsc_event/domain/entities/blog_entity.dart';
import 'package:dsc_event/domain/entities/events_entity.dart';
import 'package:dsc_event/domain/entities/podcast_entity.dart';
import 'package:dsc_event/domain/entities/teamyear_entity.dart';
import 'package:dsc_event/domain/repositories/app_repositories.dart';

class AppRepositoryImpl extends AppRepository {
  final RemoteDataSource remoteDataSource;

  AppRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<EventsEntity>>> getEvents() async {
    try {
      final events = await remoteDataSource.getEvents();
      return Right(events);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<EventsEntity>>> getMoreEvents() async {
    try {
      final events = await remoteDataSource.getMoreEvents();
      return Right(events);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<BlogEntity>>> getBlog() async {
    try {
      final blog = await remoteDataSource.getBlog();
      return Right(blog);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<BlogEntity>>> getMoreBlog() async {
    try {
      final blog = await remoteDataSource.getMoreBlog();
      return Right(blog);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<PodCastEntity>>> getPodCast() async {
    try {
      final podcast = await remoteDataSource.getPodCast();
      return Right(podcast);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<PodCastEntity>>> getMorePodCast() async {
    try {
      final podcast = await remoteDataSource.getMorePodCast();
      return Right(podcast);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<TeamYearEntity>>> getTeam() async {
    try {
      final team = await remoteDataSource.getTeam();
      return Right(team);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
