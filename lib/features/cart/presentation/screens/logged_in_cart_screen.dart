import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:flutter_amazon_app/features/cart/presentation/widgets/cart_product_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoggedInCartScreen extends StatelessWidget {
  const LoggedInCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartProductsLoaded) {
          return Column(
            children: [
              Text(state.cart.total.toString()),
              Expanded(
                child: ListView.builder(
                    itemCount: context.read<CartCubit>().cartProductQuantity(state.cart.cartProducts).length,
                    itemBuilder: ((context, index) {
                      final cart = state.cart.cartProducts;
                      final x =
                          context.read<CartCubit>().cartProductQuantity(cart);
                      return CartProductContainer(
                        cartProduct: cart.firstWhere(
                            (element) => element.id == x.keys.elementAt(index)),
                        quantity: x.values.elementAt(index),
                      );
                    })),
              ),
            ],
          );
        }
        return const LoadingIndicator();
      },
    );
  }
}
