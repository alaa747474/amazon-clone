import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_amazon_app/features/auth/data/model/user.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/base_sign_in_repository.dart';

class SignInRepository extends BaseSignInRepository {
  final FirebaseAuth _firebaseAuth;
  SignInRepository(this._firebaseAuth);
  @override
  Future signIn(UserModel userModel) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
  }

  @override
  signOut()async{
   await _firebaseAuth.signOut();
  }
}
