import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_event/common/constants/Strings.dart';
import 'package:dsc_event/data/core/api_constants.dart';
import 'package:dsc_event/data/models/blog.dart';
import 'package:dsc_event/data/models/events.dart';

abstract class RemoteDataSource {
  Future<List<Events>> getEvents();

  Future<List<Events>> getMoreEvents();

  Future<List<Blog>> getBlog();

  Future<List<Blog>> getMoreBlog();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  static DocumentSnapshot lastEventDocs;
  static DocumentSnapshot lastBlogDocs;

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
    lastEventDocs = _querySnapshot.docs.last;
    return eType;
  }

  @override
  Future<List<Events>> getMoreEvents() async {
    final List<Events> eType = [];
    QuerySnapshot _querySnapshot = await ApiConstants.fireStore
        .collection(Strings.keyEvents)
        .startAfterDocument(lastEventDocs)
        .limit(10)
        .get();
    for (final item in _querySnapshot.docs) {
      eType.add(Events.fromJson(item.data()));
    }
    if (_querySnapshot.docs.isNotEmpty)
      lastEventDocs = _querySnapshot.docs.last;
    return eType;
  }

  @override
  Future<List<Blog>> getBlog() async {
    final List<Blog> bList = [];
    QuerySnapshot _querySnapshot = await ApiConstants.fireStore
        .collection(Strings.keyEvents)
        .limit(10)
        .get();
    for (final item in _querySnapshot.docs) {
      bList.add(Blog.fromJson(item.data()));
    }
    lastBlogDocs = _querySnapshot.docs.last;
    return bList;
  }

  @override
  Future<List<Blog>> getMoreBlog() async {
    final List<Blog> bList = [];
    QuerySnapshot _querySnapshot = await ApiConstants.fireStore
        .collection(Strings.keyEvents)
        .startAfterDocument(lastEventDocs)
        .limit(10)
        .get();
    for (final item in _querySnapshot.docs) {
      bList.add(Blog.fromJson(item.data()));
    }
    if (_querySnapshot.docs.isNotEmpty) lastBlogDocs = _querySnapshot.docs.last;
    return bList;
  }
}
