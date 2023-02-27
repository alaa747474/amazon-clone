import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreService {
  FireStoreService._();
  static final instance = FireStoreService._();
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Future<List<T>> getSubCollectionData<T>(
      {required String firstCollection,
      required String secondCollection,
      required T Function(
        Map<String, dynamic>? data,
      )
          builder}) async {
    var reference = await _fireStore
        .collection(firstCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(secondCollection)
        .get();
    return reference.docs.map((e) => builder(e.data())).toList();
  }

  Future<List<T>> getCollectionData<T>(
      {required String collection,
      required T Function(Map<String, dynamic>? data) builder}) async {
    var reference = await _fireStore.collection(collection).get();
    return reference.docs.map((e) => builder(e.data())).toList();
  }

  Future<void> addData(
      {required String firstCollection,
      required String secondCollection,
      required Map<String, dynamic> data}) async {
    _fireStore
        .collection(firstCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(secondCollection)
        .doc()
        .set(data);
  }
}
