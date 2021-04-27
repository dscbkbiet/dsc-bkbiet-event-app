import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_event/common/constants/Strings.dart';
import 'package:dsc_event/data/core/api_constants.dart';
import 'package:dsc_event/data/models/events.dart';

abstract class RemoteDataSource {
  Future<List<Events>> getEvents();
  Future<List<Events>> getMoreEvents(List<dynamic> list);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<List<Events>> getEvents() async {
    final List<Events> eType = [];
    QuerySnapshot _querySnapshot = await ApiConstants.fireStore
        .collection(Strings.keyEvents)
        .limit(10)
        .get();
    for (final item in _querySnapshot.docs) {
      eType.add(Events.fromJson(item.data()));
    }
    return eType;
  }

  @override
  Future<List<Events>> getMoreEvents(List<dynamic> list) async {
    final List<Events> eType = [];
    QuerySnapshot _querySnapshot = await ApiConstants.fireStore
        .collection(Strings.keyEvents)
        .startAfter(list)
        .limit(10)
        .get();
    for (final item in _querySnapshot.docs) {
      eType.add(Events.fromJson(item.data()));
    }
    return eType;
  }
}
