import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/utils/service_locator.dart';

import 'package:flutter_amazon_app/core/widgets/custom_button.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:flutter_amazon_app/features/cart/presentation/widgets/cart_product_container.dart';
import 'package:flutter_amazon_app/features/order/presentation/screens/delivery_information_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoggedInCartScreen extends StatelessWidget {
  const LoggedInCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<CartCubit>()..getCartProducts(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartProductsLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: Text(
                    'Subtotal \$${state.cart.total}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  child: CustomButton(
                      text:
                          'Proceed to checkout  (${state.cart.cartProducts.length} items)',
                      onPressed: () {
                        Navigator.pushNamed(
                            context, DeliveryInformationScreen.routeName,
                            arguments: DeliveryInformationScreen(
                                products: state.cart.cartProducts,
                                total: state.cart.total.toString()));
                      }),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: context
                          .read<CartCubit>()
                          .cartProductQuantity(state.cart.cartProducts)
                          .length,
                      itemBuilder: ((context, index) {
                        final cart = state.cart.cartProducts;
                        final productsMap =
                            context.read<CartCubit>().cartProductQuantity(cart);
                        return CartProductContainer(
                          cartProduct: cart.firstWhere((element) =>
                              element.id == productsMap.keys.elementAt(index)),
                          quantity: productsMap.values.elementAt(index),
                        );
                      })),
                ),
              ],
            );
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}
