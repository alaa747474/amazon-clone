import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/cart/business_logic/cubit/cart_cubit.dart';

import 'package:flutter_amazon_app/features/cart/presentation/widgets/cart_delete_button.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cart_quantity_button.dart';

class CartProductContainer extends StatelessWidget {
  const CartProductContainer(
      {super.key, required this.cartProduct, required this.quantity});
  final Product cartProduct;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      height: 195.h,
      color: Theme.of(context).primaryColorLight,
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  cartProduct.image,
                  width: 150.w,
                  height: 150,
                ),
                SizedBox(
                  width: 150.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      Text(
                        cartProduct.name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 10.h,),
                      Text('\$${cartProduct.price}',style: Theme.of(context).textTheme.headline4,),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return CartQuantityButton(
                      quantity: quantity,
                      addOnTap: () {
                        context.read<CartCubit>().addToCart(product: cartProduct);
                      },
                      removeOnTap: () {
                        context
                            .read<CartCubit>()
                            .removeFromCart(product: cartProduct);
                      },
                    );
                  },
                ),
            
                InkWell(
                  onTap: () {
                    context.read<CartCubit>().deleteAllProductQuantities(product: cartProduct);
                  },
                  child: const CartDeleteButton()),
                   SizedBox(width: 40.h,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
