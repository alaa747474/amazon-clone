import 'package:flutter_amazon_app/features/auth/data/model/user.dart';

abstract class BaseCreateAccountRepository{
  Future <void> createAccount({required UserModel userModel});
 
}