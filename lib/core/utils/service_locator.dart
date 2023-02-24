import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/create_account_repository.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/sign_in_repository.dart';
import 'package:flutter_amazon_app/features/order/data/repository/order_repositoey.dart';
import 'package:flutter_amazon_app/features/profile/data/repository/user_profile_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void serviceLocatorSetUp() {
  getIt.registerSingleton<UserProfileRepository>(UserProfileRepository(FirebaseAuth.instance,FirebaseFirestore.instance));
  getIt.registerSingleton<OrderRepository>(OrderRepository(FirebaseFirestore.instance, FirebaseAuth.instance));
  getIt.registerSingleton<SignInRepository>(SignInRepository(FirebaseAuth.instance));
  getIt.registerSingleton<CreateAccountRepository>(CreateAccountRepository(FirebaseAuth.instance,FirebaseFirestore.instance));
}
