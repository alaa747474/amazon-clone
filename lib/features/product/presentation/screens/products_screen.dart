import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/core/widgets/custom_search_field.dart';
import 'package:flutter_amazon_app/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_amazon_app/features/product/presentation/widgets/product_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.products});
  static const String routeName='/products_screen';
  final List<Product>products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: CustomAppBar(alignment: Alignment.bottomCenter,appBarHeight:65.h,child: Row(
        children: [
           Padding(
             padding:  EdgeInsets.only(left: 4.w,right: 8.w),
             child: InkWell(onTap: ()=>Navigator.pop(context),child: const Icon(Icons.arrow_back)),
           ),
          const Flexible(child: CustomSearchField()),
        ],
      ),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
            child: Text('Results',style: Theme.of(context).textTheme.headline2,),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context,index){
              return Column(
                children: [
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          IconButton(onPressed: (){
                            context.read<CartCubit>().addToCart(product: products[index]);
                          }, icon:Icon(Icons.add)),
                          IconButton(onPressed: (){
                            context.read<CartCubit>().removeFromCart(product: products[index]);
                          }, icon:Icon(Icons.remove))
                        ],
                      );
                    },
                  ),
                  ProductContainer(
                    name: products[index].name,
                    price: products[index].price.toString(),
                    image: products[index].image,),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}