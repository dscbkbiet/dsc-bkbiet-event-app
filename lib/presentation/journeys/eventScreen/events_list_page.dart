import 'package:dsc_event/di/get_it.dart';
import 'package:dsc_event/domain/entities/events_entity.dart';
import 'package:dsc_event/presentation/blocs/eventsList/events_list_cubit.dart';
import 'package:dsc_event/presentation/journeys/eventScreen/event_list.dart';
import 'package:dsc_event/presentation/widgets/loading_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsListPage extends StatefulWidget {
  @override
  _EventsListPageState createState() => _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {
  EventsListCubit _eventsListCubit;
  List<EventsEntity> _eventsList = [];

  @override
  void initState() {
    super.initState();
    _eventsListCubit = getItInstance<EventsListCubit>();
    _eventsListCubit.loadEvents();
  }

  //;
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
          if (state is EventsListLoading) {
            return Container();
          } else if (state is EventsListLoaded) {
            _eventsList = state.eventsEntity;
            return EventList(
              onComplete: () {
                _eventsListCubit.loadMoreEvents(_eventsList);
              },
              list: _eventsList,
            );
          } else if (state is EventsListLoadingMore) {
            return Column(
              children: [
                Expanded(
                  flex: 9,
                  child: EventList(
                    onComplete: () {
                      _eventsListCubit.loadMoreEvents(_eventsList);
                    },
                    list: _eventsList,
                  ),
                ),
                Expanded(flex: 1, child: LoadingBar())
              ],
            );
          } else if (state is EventsListLoadMore) {
            _eventsList += state.eventsEntity;
            return EventList(
              onComplete: () {
                _eventsListCubit.loadMoreEvents(_eventsList);
              },
              list: _eventsList,
            );
          } else if (state is EventsListError) {
            return Container();
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
