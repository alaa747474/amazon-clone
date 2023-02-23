import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_amazon_app/core/constants/constants.dart';
import 'package:flutter_amazon_app/features/auth/data/model/user.dart';

import 'base_user_profile_repository.dart';

class UserProfileRepository extends BaseUserProfileRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  UserProfileRepository(this._firebaseAuth, this._firebaseFirestore);
  @override
  Future<UserModel> getUserInformation() async{
    var collection= await _firebaseFirestore.collection(usersCollection).doc(_firebaseAuth.currentUser!.uid).get();
    return UserModel.fromMap(collection.data()!);
  }
  
}