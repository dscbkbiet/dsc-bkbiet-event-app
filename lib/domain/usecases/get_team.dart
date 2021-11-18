import 'package:dartz/dartz.dart';
import 'package:dsc_event/domain/entities/app_error.dart';
import 'package:dsc_event/domain/entities/no_params.dart';
import 'package:dsc_event/domain/entities/teamyear_entity.dart';
import 'package:dsc_event/domain/repositories/app_repositories.dart';
import 'package:dsc_event/domain/usecases/usecase.dart';

class GetTeam extends UseCase<List<TeamYearEntity>, NoParams> {
  final AppRepository repository;

  GetTeam(this.repository);

  @override
  Future<Either<AppError, List<TeamYearEntity>>> call(NoParams params) async {
    return await repository.getTeam();
  }
}
