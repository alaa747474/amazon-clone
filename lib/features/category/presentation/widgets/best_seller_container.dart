import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/product/business_logic/cubit/product_cubit.dart';
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
                  style: Theme.of(context).textTheme.headline2,
                ),
                Flexible(
                  flex: 8,
                  child: GridView.builder(
                    clipBehavior: Clip.antiAlias,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 170.h,
                        mainAxisSpacing: 5.h,
                        crossAxisSpacing: 5.h),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                bestSellerProducts[index].image,
                                height: 115.h,
                              ),
                              Text(
                                '\$${bestSellerProducts[index].price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.red),
                              ),
                              Text(
                                bestSellerProducts[index].name,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                        );
                      });
                    },
                  ),
                ),
                Text(
                  'Sea all daels',
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
