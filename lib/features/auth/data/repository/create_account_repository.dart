import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_amazon_app/features/auth/data/model/user.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/base_create_account_repository.dart';

class CreateAccountRepository extends BaseCreateAccountRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  CreateAccountRepository(this._firebaseAuth, this._firebaseFirestore);
  @override
  Future<void> createAccount({required UserModel userModel}) async{ 
   await _firebaseAuth.createUserWithEmailAndPassword(email: userModel.email, password: userModel.password);
   _firebaseFirestore.collection('users').doc(_firebaseAuth.currentUser!.uid).set(userModel.toMap());
  }
  
 
}