import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/category/data/model/category.dart';
import 'package:flutter_amazon_app/features/product/business_logic/cubit/product_cubit.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/products_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerCategoryContainer extends StatelessWidget {
  const BestSellerCategoryContainer(
      {super.key, required this.category, required this.index});
  final Category category;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          index == 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Best Seller Deals',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 25.sp),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Center(
                        child: Text(
                      'MUST-SEE DEALS',
                      style: Theme.of(context).textTheme.headline2,
                    )),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                )
              : const SizedBox(),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoaded) {
                final customCategoryProductsBestSeller = state.products.where(
                    (element) =>
                        element.bestSeller == true &&
                        element.category == category.name).toList();
                return InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, ProductsScreen.routeName,
                      arguments: customCategoryProductsBestSeller),
                  child: Container(
                    height: 300.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(category.image),
                            fit: BoxFit.cover)),
                  ),
                );
              }
              return const LoadingIndicator();
            },
          ),
          Text(
            category.name,
            style: Theme.of(context).textTheme.headline2,
          )
        ],
      ),
    );
  }
}
