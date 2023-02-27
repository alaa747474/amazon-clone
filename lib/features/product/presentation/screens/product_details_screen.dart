import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/utils/custom_snakbar.dart';
import 'package:flutter_amazon_app/core/utils/service_locator.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/core/widgets/custom_button.dart';
import 'package:flutter_amazon_app/core/widgets/custom_search_field.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/cart/business_logic/cubit/cart_cubit.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_amazon_app/features/product/presentation/widgets/siggestion_products_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;
  static const String routeName = '/product_details_screen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<CartCubit>(),
      
      
      child: Scaffold(
        appBar: CustomAppBar(
          alignment: Alignment.bottomCenter,
          appBarHeight: 65.h,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 8.w),
                child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back)),
              ),
              const Flexible(child: CustomSearchField()),
            ],
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              width: double.infinity,
              color: Theme.of(context).primaryColorLight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    product.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              width: double.infinity,
              height: 300.h,
              color: Theme.of(context).primaryColorLight,
              child: Image.network(
                product.image,
                width: 150.w,
                height: 200.h,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              color: Theme.of(context).primaryColorLight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$ ${product.price}',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  product.bestSeller
                      ? Text(
                          'Best Seller !',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.red[700]),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: 5.h,
                  ),
                  BlocConsumer<CartCubit, CartState>(
                    listener: (context, state) {
                      if (state is ProductAddedToCart) {
                        showCustomSnackBar(
                            context: context, content: 'Added to Cart');
                      }
                    },
                    builder: (context, state) {
                      if (state is ProductAddedToCart) {
                        return const LoadingIndicator();
                      }
                      return CustomButton(
                          text: 'Add To Cart',
                          onPressed: () {
                            context
                                .read<CartCubit>()
                                .addToCart(product: product);
                          });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SuggestionProductsContainer(
              category: product.category,
              currentProductId: product.id,
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}
