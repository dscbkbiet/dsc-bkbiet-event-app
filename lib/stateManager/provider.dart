import 'package:dsc_event/model/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventsProvider =
    ChangeNotifierProvider<EventsProvider>((ref) => EventsProvider());

class EventsProvider extends ChangeNotifier {
  List<Events> _event = new List.empty(growable: true);

  List<dynamic> get event => _event;

  void add(Events value) {
    _event.add(value);
    notifyListeners();
  }

  void clear() {
    _event.clear();
    _event = new List.empty(growable: true);
    notifyListeners();
  }

  void addAll(List<Events> value) {
    _event.addAll(value);
    notifyListeners();
  }

  void clearAndAddAll(List<Events> value) {
    _event.clear();
    _event = new List.empty(growable: true);
    _event.addAll(value);
    notifyListeners();
  }
}
