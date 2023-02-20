import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cart_quantity_button.dart';

class CartProductContainer extends StatelessWidget {
  const CartProductContainer({super.key, required this.cartProduct, required this.quantity});
  final Product cartProduct;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 250.h,
      color: Theme.of(context).primaryColorLight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250.h,
            child: Column(
              children: [
                Image.network(
                  cartProduct.image,
                  width: 150.w,
                  height: 200,
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return CartQuantityButton(
                      quantity: quantity,
                      addOnTap: () {
                        context.read<CartCubit>().addToCart(product: cartProduct);
                      },
                      removeOnTap: () {
                        context.read<CartCubit>().removeFromCart(product: cartProduct);
                      },
                    );
                  },
                )
              ],
            ),
          ),
          Column(),
        ],
      ),
    );
  }
}
