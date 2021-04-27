import 'package:dartz/dartz.dart';
import 'package:dsc_event/domain/entities/app_error.dart';
import 'package:dsc_event/domain/entities/events_entity.dart';
import 'package:dsc_event/domain/entities/no_params.dart';
import 'package:dsc_event/domain/repositories/app_repositories.dart';
import 'package:dsc_event/domain/usecases/usecase.dart';

class GetEvents extends UseCase<List<EventsEntity>, NoParams> {
  final AppRepository repository;
  GetEvents(this.repository);
  @override
  Future<Either<AppError, List<EventsEntity>>> call(NoParams noParams) async {
    return await repository.getEvents();
  }
}
