import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/products_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings){
    switch (settings.name) {
      case ProductsScreen.routeName:
      final products= settings.arguments as List<Product>;
      return MaterialPageRoute(builder: (_)=>ProductsScreen(products: products,));
    }
    return MaterialPageRoute(builder: (_)=>const HomeScreen());
  }
}