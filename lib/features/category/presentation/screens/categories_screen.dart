import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/category/presentation/widgets/best_seller_container.dart';
import 'package:flutter_amazon_app/features/category/presentation/widgets/category_stack.dart';
import 'package:flutter_amazon_app/features/category/presentation/widgets/electronics_discount_container.dart';
import 'package:flutter_amazon_app/features/category/presentation/widgets/sign_in_suggestion_container.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          const CategoryStack(),
          SizedBox(
            height: mediaQueryHeight / 6.5,
          ),
          const SignInSuggestionContainer(),
          SizedBox(
            height: mediaQueryHeight / 95,
          ),
          const BestSellerProducstContainer(),
          SizedBox(
            height: mediaQueryHeight / 95,
          ),
          const ElectronicsDiscountContainer(),
        ],
      ),
    );
  }
}
