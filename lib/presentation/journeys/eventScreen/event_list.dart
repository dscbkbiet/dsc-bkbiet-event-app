import 'package:dsc_event/domain/entities/events_entity.dart';
import 'package:dsc_event/presentation/journeys/eventScreen/event_card.dart';
import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  const EventList({Key key, this.onComplete, this.list}) : super(key: key);
  final VoidCallback onComplete;
  final List<EventsEntity> list;

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
    _controllerEventsList?.dispose();
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
    return SingleChildScrollView(
      controller: _controllerEventsList,
      key: ValueKey("event_list"),
      child: Column(
        children: widget.list.map((e) => EventCard(events: e)).toList(),
      ),
    );
  }
}
