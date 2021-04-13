import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_event/services/FireStoreService.dart';

class Common{
  Common._();
  static final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  static final FireStoreService calls = FireStoreService();

}