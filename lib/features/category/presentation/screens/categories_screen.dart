import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/core/widgets/custom_search_field.dart';
import 'package:flutter_amazon_app/features/category/presentation/widgets/best_seller_container.dart';
import 'package:flutter_amazon_app/features/category/presentation/widgets/category_stack.dart';
import 'package:flutter_amazon_app/features/category/presentation/widgets/discount_container.dart';
import 'package:flutter_amazon_app/features/category/presentation/widgets/sign_in_suggestion_container.dart';
import 'package:flutter_amazon_app/features/home/business_logic/cubit/user_auth_state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: 65.h,
        alignment: Alignment.bottomCenter,
        child: const CustomSearchField(),
      ),
      body: ListView(
        children: [
          const CategoryStack(),
          SizedBox(
            height: mediaQueryHeight / 6.5,
          ),
          BlocBuilder<UserAuthStateCubit, UserAuthStateState>(
            builder: (context, state) {
              if (state is UserLoggedInState) {
                return state.user == null
                    ? const SignInSuggestionContainer()
                    : const SizedBox();
              }
              return const SignInSuggestionContainer();
            },
          ),
          SizedBox(
            height: mediaQueryHeight / 95,
          ),
          const BestSellerProducstContainer(),
          SizedBox(
            height: mediaQueryHeight / 95,
          ),
          const DiscountContainer(
            category: 'Electronics',
            price: 300,
          ),
          SizedBox(
            height: mediaQueryHeight / 95,
          ),
          const DiscountContainer(
            category: "Women's Fashion",
            price: 70,
          ),
          SizedBox(
            height: mediaQueryHeight / 95,
          ),
          const DiscountContainer(
            category: "Men's Fashion",
            price: 120,
          ),
          SizedBox(
            height: mediaQueryHeight / 95,
          ),
          const DiscountContainer(
            category: "Kids Fashion",
            price: 90,
          ),
        ],
      ),
    );
  }
}
