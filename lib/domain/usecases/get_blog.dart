import 'package:dartz/dartz.dart';
import 'package:dsc_event/domain/entities/app_error.dart';
import 'package:dsc_event/domain/entities/blog_entity.dart';
import 'package:dsc_event/domain/entities/no_params.dart';
import 'package:dsc_event/domain/repositories/app_repositories.dart';
import 'package:dsc_event/domain/usecases/usecase.dart';

class GetBlog extends UseCase<List<BlogEntity>, NoParams> {
  final AppRepository repository;

  GetBlog(this.repository);

  @override
  Future<Either<AppError, List<BlogEntity>>> call(NoParams noParams) async {
    return await repository.getBlog();
  }
}
