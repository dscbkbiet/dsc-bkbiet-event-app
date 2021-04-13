import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_event/consts/Common.dart';
import 'package:dsc_event/consts/Strings.dart';
import 'package:dsc_event/model/events.dart';
import 'package:dsc_event/stateManager/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FireStoreService {
  List<DocumentSnapshot> _eventList;

  Future<void> getEvents(BuildContext context) async {
    try {
      final List<Events> eType = [];
      QuerySnapshot _querySnapshot =
          await Common.fireStore.collection(Strings.keyEvents).limit(10).get();
      _eventList = _querySnapshot.docs;
      for (final item in _querySnapshot.docs) {
        eType.add(Events.fromJson(item.data()));
      }
      print(eType);
      context.read(eventsProvider).addAll(eType);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMoreEvents(BuildContext context) async {
    try {
      final List<Events> eType = [];
      QuerySnapshot _querySnapshot = await Common.fireStore
          .collection(Strings.keyEvents)
          .startAfterDocument(_eventList[_eventList.length - 1])
          .limit(10)
          .get();
      _eventList = _querySnapshot.docs;
      for (final item in _querySnapshot.docs) {
        eType.add(Events.fromJson(item.data()));
      }
      context.read(eventsProvider).addAll(eType);
    } catch (e) {
      print(e);
    }
  }
}
