import 'package:flutter/material.dart';

import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/core/widgets/custom_search_field.dart';
import 'package:flutter_amazon_app/features/cart/presentation/screens/logged_in_cart_screen.dart';
import 'package:flutter_amazon_app/features/cart/presentation/screens/not_logged_in_cart_screen.dart';
import 'package:flutter_amazon_app/features/home/business_logic/cubit/user_auth_state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          appBarHeight: 65.h,
          alignment: Alignment.bottomCenter,
          child: const CustomSearchField()),
      body: BlocBuilder<UserAuthStateCubit, UserAuthStateState>(
      builder: (context, state) {
        if (state is UserLoggedInState) {
          return state.user==null? const NotLoggedInCartScreen():const LoggedInCartScreen();
        }
        return const NotLoggedInCartScreen();
      },
    ),
    );
  }
}