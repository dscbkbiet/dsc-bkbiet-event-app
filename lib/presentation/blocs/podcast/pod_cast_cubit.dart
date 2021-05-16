import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dsc_event/domain/entities/app_error.dart';
import 'package:dsc_event/domain/entities/no_params.dart';
import 'package:dsc_event/domain/entities/podcast_entity.dart';
import 'package:dsc_event/domain/usecases/get_more_podcast.dart';
import 'package:dsc_event/domain/usecases/get_podcast.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pod_cast_state.dart';

class PodCastCubit extends Cubit<PodCastState> {
  final GetPodCast getPodCast;
  final GetMorePodCast getMorePodCast;

  PodCastCubit({@required this.getPodCast, @required this.getMorePodCast})
      : super(PodCastInitial());

  void loadPodCast() async {
    emit(PodCastLoading());
    final Either<AppError, List<PodCastEntity>> eitherResponse =
        await getPodCast(NoParams());

    emit(eitherResponse.fold(
      (l) => PodCastError(),
      (r) => PodCastLoaded(r),
    ));
  }

  void loadMorePodCast() async {
    emit(MorePodCastLoading());
    final Either<AppError, List<PodCastEntity>> eitherResponse =
        await getMorePodCast(NoParams());

    emit(eitherResponse.fold(
      (l) => PodCastError(),
      (r) => MorePodCastLoaded(r),
    ));
  }
}
