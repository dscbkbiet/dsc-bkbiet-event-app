import 'package:dartz/dartz.dart';
import 'package:dsc_event/domain/entities/app_error.dart';
import 'package:dsc_event/domain/entities/no_params.dart';
import 'package:dsc_event/domain/entities/podcast_entity.dart';
import 'package:dsc_event/domain/repositories/app_repositories.dart';
import 'package:dsc_event/domain/usecases/usecase.dart';

class GetPodCast extends UseCase<List<PodCastEntity>, NoParams> {
  final AppRepository repository;

  GetPodCast(this.repository);

  @override
  Future<Either<AppError, List<PodCastEntity>>> call(NoParams params) async {
    return await repository.getPodCast();
  }
}
