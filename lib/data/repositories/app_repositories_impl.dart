import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dsc_event/data/data_sources/remote_data_source.dart';
import 'package:dsc_event/domain/entities/app_error.dart';
import 'package:dsc_event/domain/entities/events_entity.dart';
import 'package:dsc_event/domain/repositories/app_repositories.dart';

class AppRepositoryImpl extends AppRepository {
  final RemoteDataSource remoteDataSource;

  AppRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<EventsEntity>>> getEvents() async {
    try {
      final movies = await remoteDataSource.getEvents();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<EventsEntity>>> getMoreEvents(
      List<dynamic> list) async {
    try {
      final movies = await remoteDataSource.getMoreEvents(list);
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
