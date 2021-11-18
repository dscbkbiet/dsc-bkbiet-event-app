import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_event/common/constants/Strings.dart';
import 'package:dsc_event/data/core/api_constants.dart';
import 'package:dsc_event/data/models/blog.dart';
import 'package:dsc_event/data/models/events.dart';
import 'package:dsc_event/data/models/podcast.dart';
import 'package:dsc_event/data/models/teamyear.dart';

abstract class RemoteDataSource {
  Future<List<Events>> getEvents();

  Future<List<Events>> getMoreEvents();

  Future<List<Blog>> getBlog();

  Future<List<Blog>> getMoreBlog();

  Future<List<PodCast>> getPodCast();

  Future<List<PodCast>> getMorePodCast();

  Future<List<TeamYear>> getTeam();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  static late DocumentSnapshot lastEventDocs;
  static late DocumentSnapshot lastBlogDocs;
  static late DocumentSnapshot lastPodCastDocs;

  @override
  Future<List<Events>> getEvents() async {
    final List<Events> eList = [];
    QuerySnapshot _querySnapshot = await ApiConstants.fireStore
        .collection(Strings.keyEvents)
        .orderBy("id", descending: true)
        .limit(10)
        .get();
    for (final item in _querySnapshot.docs) {
      eList.add(Events.fromJson(item.data() as Map));
    }
    lastEventDocs = _querySnapshot.docs.last;
    return eList;
  }

  @override
  Future<List<Events>> getMoreEvents() async {
    final List<Events> eList = [];
    QuerySnapshot _querySnapshot = await ApiConstants.fireStore
        .collection(Strings.keyEvents)
        .orderBy("id", descending: true)
        .startAfterDocument(lastEventDocs)
        .limit(10)
        .get();
    for (final item in _querySnapshot.docs) {
      eList.add(Events.fromJson(item.data() as Map));
    }
    if (_querySnapshot.docs.isNotEmpty)
      lastEventDocs = _querySnapshot.docs.last;
    return eList;
  }

  @override
  Future<List<Blog>> getBlog() async {
    final List<Blog> bList = [];
    QuerySnapshot _querySnapshot = await ApiConstants.fireStore
        .collection(Strings.keyBlog)
        .orderBy("blogId", descending: true)
        .limit(10)
        .get();
    for (final item in _querySnapshot.docs) {
      bList.add(Blog.fromJson(item.data() as Map));
    }
    lastBlogDocs = _querySnapshot.docs.last;
    return bList;
  }

  @override
  Future<List<Blog>> getMoreBlog() async {
    final List<Blog> bList = [];
    QuerySnapshot _querySnapshot = await ApiConstants.fireStore
        .collection(Strings.keyBlog)
        .orderBy("blogId", descending: true)
        .startAfterDocument(lastBlogDocs)
        .limit(10)
        .get();
    for (final item in _querySnapshot.docs) {
      bList.add(Blog.fromJson(item.data() as Map));
    }
    if (_querySnapshot.docs.isNotEmpty) lastBlogDocs = _querySnapshot.docs.last;
    return bList;
  }

  @override
  Future<List<PodCast>> getPodCast() async {
    final List<PodCast> pList = [];
    QuerySnapshot _querySnapshot = await ApiConstants.fireStore
        .collection(Strings.keyAudio)
        .orderBy("audioId", descending: true)
        .limit(10)
        .get();
    for (final item in _querySnapshot.docs) {
      pList.add(PodCast.fromJson(item.data() as Map));
    }
    if (_querySnapshot.docs.isNotEmpty)
      lastPodCastDocs = _querySnapshot.docs.last;
    return pList;
  }

  @override
  Future<List<PodCast>> getMorePodCast() async {
    final List<PodCast> pList = [];
    QuerySnapshot _querySnapshot = await ApiConstants.fireStore
        .collection(Strings.keyAudio)
        .orderBy("audioId", descending: true)
        .startAfterDocument(lastPodCastDocs)
        .limit(10)
        .get();
    for (final item in _querySnapshot.docs) {
      pList.add(PodCast.fromJson(item.data() as Map));
    }
    if (_querySnapshot.docs.isNotEmpty)
      lastPodCastDocs = _querySnapshot.docs.last;
    return pList;
  }

  @override
  Future<List<TeamYear>> getTeam() async {
    final List<TeamYear> tyList = [];
    QuerySnapshot _querySnapshot  = await ApiConstants.fireStore
        .collection(Strings.keyTeam)
        .orderBy("year", descending: true)
        .get();
    for (final item in _querySnapshot.docs) {
      tyList.add(TeamYear.fromJson(item.data() as Map));
    }
    return tyList;
  }
}
