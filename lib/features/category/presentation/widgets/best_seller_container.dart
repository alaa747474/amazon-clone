import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/product/business_logic/cubit/product_cubit.dart';
import 'package:flutter_amazon_app/features/category/presentation/screens/best_seller_category_screen.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerProducstContainer extends StatelessWidget {
  const BestSellerProducstContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      width: double.maxFinite,
      height: 400.h,
      color: Theme.of(context).primaryColorLight,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            final bestSellerProducts = state.products
                .where((element) => element.bestSeller == true)
                .toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Best Seller',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Flexible(
                  flex: 8,
                  child: GridView.builder(
                    clipBehavior: Clip.antiAlias,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 160.h,
                        mainAxisSpacing: 5.h,
                        crossAxisSpacing: 5.h),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return InkWell(
                          onTap: ()=>Navigator.pushNamed(context, ProductDetailsScreen.routeName,arguments: bestSellerProducts[index]),
                          child: SizedBox(
                            
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  bestSellerProducts[index].image,
                                  height: 115.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                  '\$${bestSellerProducts[index].price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                ),
                                Text(
                                  bestSellerProducts[index].name,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
                InkWell(
                  onTap: ()=>Navigator.pushNamed(context, BestSellerCategoryScreen.routeName),
                  child: Text(
                    'Sea all daels',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              ],
            );
          }
          return ErrorWidget('Something went wrong');
        },
      ),
    );
  }
}
