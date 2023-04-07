import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_amazon_app/features/auth/business_logic/create_account_cubit/create_account_cubit.dart';
import 'package:flutter_amazon_app/features/auth/business_logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/create_account_repository.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/sign_in_repository.dart';
import 'package:flutter_amazon_app/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:flutter_amazon_app/features/cart/data/repository/cart_repository.dart';
import 'package:flutter_amazon_app/features/order/business_logic/cubit/order_cubit.dart';
import 'package:flutter_amazon_app/features/order/data/repository/order_repositoey.dart';
import 'package:flutter_amazon_app/features/profile/business_logic/cubit/user_profile_cubit.dart';
import 'package:flutter_amazon_app/features/profile/data/repository/user_profile_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void serviceLocatorSetUp() {
  getIt.registerSingleton<UserProfileCubit>(UserProfileCubit(
      UserProfileRepository(
          FirebaseAuth.instance, FirebaseFirestore.instance)));
  getIt.registerSingleton<OrderCubit>(OrderCubit(OrderRepository()));
  getIt.registerSingleton<SignInCubit>(
      SignInCubit(SignInRepository(FirebaseAuth.instance)));
  getIt.registerSingleton<CreateAccountCubit>(CreateAccountCubit(
      CreateAccountRepository(
          FirebaseAuth.instance, FirebaseFirestore.instance)));
  getIt.registerSingleton<CartCubit>(CartCubit(
      CartRepository(FirebaseFirestore.instance, FirebaseAuth.instance)));
  getIt.registerSingleton<SignInRepository>(
      SignInRepository(FirebaseAuth.instance));
}
