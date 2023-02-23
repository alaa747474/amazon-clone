import 'package:flutter_amazon_app/features/auth/data/model/user.dart';

abstract class BaseUserProfileRepository {
  Future<UserModel>getUserInformation();
}