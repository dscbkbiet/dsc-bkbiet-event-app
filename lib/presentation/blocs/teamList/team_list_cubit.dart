import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dsc_event/domain/entities/app_error.dart';
import 'package:dsc_event/domain/entities/no_params.dart';
import 'package:dsc_event/domain/entities/teamyear_entity.dart';
import 'package:dsc_event/domain/usecases/get_team.dart';
import 'package:equatable/equatable.dart';

part 'team_list_state.dart';

class TeamListCubit extends Cubit<TeamListState> {
  final GetTeam getTeam;

  TeamListCubit({required this.getTeam}) : super(TeamListInitial());

  void loadTeam() async {
    emit(TeamListLoading());
    final Either<AppError, List<TeamYearEntity>> eitherResponse =
        await getTeam(NoParams());

    emit(eitherResponse.fold(
      (l) => TeamListError(),
      (r) => TeamListLoaded(r),
    ));
  }
}
