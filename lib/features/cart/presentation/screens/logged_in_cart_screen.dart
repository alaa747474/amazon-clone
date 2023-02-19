import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_button.dart';
import 'package:flutter_amazon_app/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_amazon_app/features/product/presentation/widgets/product_container.dart';
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
              Text(state.cartProducts.total.toString()),
              Expanded(
                child: ListView.builder(
                  
                  itemCount: state.cartProducts.cartProducts.length,
                  itemBuilder: ((context, index) {
                     final myList =state.cartProducts.cartProducts[index];
                  return ProductContainer(image: myList.image, name: myList.name, price: myList.price.toString());
                })),
              ),
            ],
          );
        }
        return Text('alla');
      },
    );
  }
}