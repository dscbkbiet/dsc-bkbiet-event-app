import 'package:dartz/dartz.dart';
import 'package:dsc_event/domain/entities/app_error.dart';
import 'package:dsc_event/domain/entities/events_entity.dart';

abstract class AppRepository {
  Future<Either<AppError, List<EventsEntity>>> getEvents();
  Future<Either<AppError, List<EventsEntity>>> getMoreEvents(List<dynamic> list);
}
