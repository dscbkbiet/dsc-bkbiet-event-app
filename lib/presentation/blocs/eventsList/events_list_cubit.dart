import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dsc_event/domain/entities/app_error.dart';
import 'package:dsc_event/domain/entities/events_entity.dart';
import 'package:dsc_event/domain/entities/no_params.dart';
import 'package:dsc_event/domain/usecases/get_events.dart';
import 'package:dsc_event/presentation/blocs/loading/loading_cubit.dart';
import 'package:meta/meta.dart';

part 'events_list_state.dart';

class EventsListCubit extends Cubit<EventsListState> {
  final GetEvents getEvents;
  final LoadingCubit loadingCubit;

  EventsListCubit({@required this.getEvents, @required this.loadingCubit})
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

  void loadMoreEvents(List<dynamic> list) async {
    emit(EventsListLoadingMore());
    final Either<AppError, List<EventsEntity>> eitherResponse =
        await getEvents(NoParams());

    emit(eitherResponse.fold(
      (l) => EventsListError(),
      (r) => EventsListLoadMore(r),
    ));
  }
}
