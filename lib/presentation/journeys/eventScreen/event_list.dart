import 'dart:async';

import 'package:dsc_event/domain/entities/events_entity.dart';
import 'package:dsc_event/presentation/journeys/eventScreen/event_card.dart';
import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  const EventList(
      {Key? key,
      required this.onComplete,
      required this.list,
      required this.isLoading})
      : super(key: key);
  final VoidCallback onComplete;
  final List<EventsEntity> list;
  final bool isLoading;

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  ScrollController _controllerEventsList = ScrollController();

  @override
  void initState() {
    _controllerEventsList.addListener(_scrollListenerEvents);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerEventsList.dispose();
  }

  void _scrollListenerEvents() async {
    if (_controllerEventsList.offset >=
            _controllerEventsList.position.maxScrollExtent &&
        !_controllerEventsList.position.outOfRange) {
      widget.onComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controllerEventsList,
      itemCount: widget.list.length + (widget.isLoading ? 1 : 0),
      itemBuilder: (BuildContext context, int index) {
        if (index < widget.list.length) {
          return EventCard(events: widget.list[index]);
        } else {
          Timer(Duration(milliseconds: 30), () {
            _controllerEventsList
                .jumpTo(_controllerEventsList.position.maxScrollExtent);
          });
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
