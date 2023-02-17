import 'package:flutter_amazon_app/features/auth/data/model/user.dart';

abstract class BaseSignInRepository{
  Future <void> signIn(UserModel userModel);
}