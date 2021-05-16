import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dsc_event/domain/entities/app_error.dart';
import 'package:dsc_event/domain/entities/events_entity.dart';
import 'package:dsc_event/domain/entities/no_params.dart';
import 'package:dsc_event/domain/usecases/get_events.dart';
import 'package:dsc_event/domain/usecases/get_events_more.dart';
import 'package:dsc_event/presentation/blocs/loading/loading_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'events_list_state.dart';

class EventsListCubit extends Cubit<EventsListState> {
  final GetEvents getEvents;
  final GetMoreEvents getMoreEvents;
  final LoadingCubit loadingCubit;

  EventsListCubit(
      {@required this.getEvents,
      @required this.loadingCubit,
      @required this.getMoreEvents})
      : super(EventsListInitial());

  void loadEvents() async {
    emit(EventsListLoading());
    final Either<AppError, List<EventsEntity>> eitherResponse =
        await getEvents(NoParams());

    emit(eitherResponse.fold(
      (l) => EventsListError(),
      (r) => EventsListLoaded(r),
    ));
    loadingCubit.hide();
  }

  void loadMoreEvents() async {
    emit(EventsListLoadingMore());
    final Either<AppError, List<EventsEntity>> eitherResponse =
        await getMoreEvents(NoParams());

    emit(eitherResponse.fold(
      (l) => EventsListError(),
      (r) => EventsListLoadMore(r),
    ));
  }
}
