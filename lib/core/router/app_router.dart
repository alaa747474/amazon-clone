
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/auth/business_logic/create_account_cubit/create_account_cubit.dart';
import 'package:flutter_amazon_app/features/auth/business_logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/create_account_repository.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/sign_in_repository.dart';
import 'package:flutter_amazon_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter_amazon_app/features/category/presentation/screens/categories_screen.dart';
import 'package:flutter_amazon_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_amazon_app/features/category/presentation/screens/best_seller_category_screen.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/products_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings){
    switch (settings.name) {
      case ProductsScreen.routeName:
      final products= settings.arguments as List<Product>;
      return MaterialPageRoute(builder: (_)=>ProductsScreen(products: products,));
      case ProductDetailsScreen.routeName:
      final product= settings.arguments as Product;
      return MaterialPageRoute(builder: (_)=>ProductDetailsScreen(product: product));
       case CategoryScreen.routeName:
      return MaterialPageRoute(builder: (_)=>const CategoryScreen());
      case BestSellerCategoryScreen.routeName:
      return MaterialPageRoute(builder: (_)=>const BestSellerCategoryScreen());
      case SignInScreen.routeName:
      final signInArgs=settings.arguments as SignInScreen;
      
      return MaterialPageRoute(builder: (_)=>
      MultiBlocProvider(
        providers: [
           BlocProvider(
            create: (context) => CreateAccountCubit(CreateAccountRepository(FirebaseAuth.instance, FirebaseFirestore.instance)),
          ),
         BlocProvider(
            create: (context) => SignInCubit(SignInRepository(FirebaseAuth.instance,)),
          ),
        ],
        child: SignInScreen(signInExpanded: signInArgs.signInExpanded,createAccountExpanded: signInArgs.createAccountExpanded,) ,
      )  );   
    }
    return MaterialPageRoute(builder: (_)=>const HomeScreen());
  }
}