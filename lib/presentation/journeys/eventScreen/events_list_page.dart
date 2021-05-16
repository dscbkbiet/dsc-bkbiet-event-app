import 'package:dsc_event/di/get_it.dart';
import 'package:dsc_event/domain/entities/events_entity.dart';
import 'package:dsc_event/presentation/blocs/eventsList/events_list_cubit.dart';
import 'package:dsc_event/presentation/journeys/eventScreen/event_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsListPage extends StatefulWidget {
  @override
  _EventsListPageState createState() => _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {
  EventsListCubit _eventsListCubit;
  List<EventsEntity> _eventsList = List.empty(growable: true);
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _eventsListCubit = getItInstance<EventsListCubit>();
    _eventsListCubit.loadEvents();
  }

  @override
  void dispose() {
    _eventsListCubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        cubit: _eventsListCubit,
        builder: (context, state) {
          if (state is EventsListInitial ||
              state is EventsListLoading && _eventsList.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is EventsListLoaded) {
            if(_eventsList.isEmpty)
            _eventsList.addAll(state.eventsEntity);
          } else if (state is EventsListLoadingMore) {
            isLoading = true;
          } else if (state is EventsListLoadMore) {
            isLoading = false;
            if (state.eventsEntity.isNotEmpty) {
              _eventsList.addAll(state.eventsEntity);
            }
          } else if (state is EventsListError) {
            return Container();
          }
          return EventList(
            onComplete: () {
              _eventsListCubit.loadMoreEvents();
            },
            isLoading: isLoading,
            list: _eventsList,
          );
        },
      ),
    );
  }
}
