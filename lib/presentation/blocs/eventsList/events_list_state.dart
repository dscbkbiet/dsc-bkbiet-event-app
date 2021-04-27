part of 'events_list_cubit.dart';

@immutable
abstract class EventsListState {
  const EventsListState();

  @override
  List<Object> get props => [];
}

class EventsListInitial extends EventsListState {}

class EventsListLoading extends EventsListState {}

class EventsListLoaded extends EventsListState {
  final List<EventsEntity> eventsEntity;

  const EventsListLoaded(this.eventsEntity);

  @override
  List<Object> get props => [eventsEntity];
}

class EventsListLoadMore extends EventsListState {
  final List<EventsEntity> eventsEntity;

  const EventsListLoadMore(this.eventsEntity);

  @override
  List<Object> get props => [eventsEntity];
}

class EventsListLoadingMore extends EventsListState {}

class EventsListError extends EventsListState {}
