import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/core/widgets/custom_search_field.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/product/business_logic/cubit/product_cubit.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter_amazon_app/features/product/presentation/widgets/category_product_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryProductsScreen extends StatelessWidget {
  const CustomCategoryProductsScreen({super.key, required this.categoryName});
  static const String routeName = '/custom_category_products_screen';
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
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
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoaded) {
              final List<Product> categoryProducts = state.products
                  .where((element) => element.category == categoryName)
                  .toList();
              return GridView.builder(
                padding: EdgeInsets.all(10.r),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 250.r,
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.h,
                  crossAxisSpacing: 5.h
                ),
                itemCount: categoryProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: ()=>Navigator.pushNamed(context, ProductDetailsScreen.routeName,arguments: categoryProducts[index]),
                    child: CategoryProductItem(categoryProduct: categoryProducts[index]));
                },
              );
            }
            return const LoadingIndicator();
          },
        ));
  }
}

