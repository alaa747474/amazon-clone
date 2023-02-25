
import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/utils/service_locator.dart';
import 'package:flutter_amazon_app/features/auth/business_logic/create_account_cubit/create_account_cubit.dart';
import 'package:flutter_amazon_app/features/auth/business_logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/create_account_repository.dart';
import 'package:flutter_amazon_app/features/auth/data/repository/sign_in_repository.dart';
import 'package:flutter_amazon_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter_amazon_app/features/category/presentation/screens/categories_screen.dart';
import 'package:flutter_amazon_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_amazon_app/features/order/business_logic/cubit/order_cubit.dart';
import 'package:flutter_amazon_app/features/order/data/repository/order_repositoey.dart';
import 'package:flutter_amazon_app/features/order/presentation/screens/delivery_information_screen.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_amazon_app/features/category/presentation/screens/best_seller_category_screen.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/custom_category_products.dart';

import 'package:flutter_amazon_app/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/products_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      
      case CustomCategoryProductsScreen.routeName:
        final categoryName = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => CustomCategoryProductsScreen(categoryName: categoryName,));
      case ProductsScreen.routeName:
        final products = settings.arguments as List<Product>;
        return MaterialPageRoute(
            builder: (_) => ProductsScreen(
                  products: products,
                ));
      case ProductDetailsScreen.routeName:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: product));
      case CategoryScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CategoryScreen());
      case DeliveryInformationScreen.routeName:
        final deliveryInformationArgs =
            settings.arguments as DeliveryInformationScreen;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => OrderCubit(getIt.get<OrderRepository>()),
                  child: DeliveryInformationScreen(
                      products: deliveryInformationArgs.products,
                      total: deliveryInformationArgs.total),
                ));
      case BestSellerCategoryScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => const BestSellerCategoryScreen());
      case SignInScreen.routeName:
        final signInArgs = settings.arguments as SignInScreen;   
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CreateAccountCubit(getIt.get<CreateAccountRepository>()),
                    ),
                    BlocProvider(
                      create: (context) => SignInCubit(getIt.get<SignInRepository>()),
                    ),
                  ],
                  child: SignInScreen(
                    signInExpanded: signInArgs.signInExpanded,
                    createAccountExpanded: signInArgs.createAccountExpanded,
                  ),
                ));
    }
    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
