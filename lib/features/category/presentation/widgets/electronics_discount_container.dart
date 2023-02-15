import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/product/business_logic/cubit/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElectronicsDiscountContainer extends StatelessWidget {
  const ElectronicsDiscountContainer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      width: double.maxFinite,
      height: 350.h,
      color: Theme.of(context).primaryColorLight,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is Productloading) {
            return const Center(child: LoadingIndicator(),);
          }
          if (state is ProductLoaded) {
            final electronicsProductsUnder300$ = state.products
                .where((element) => element.category=='Electronics' && element.price<300)
                .toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Electronics Under 300\$',
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
                        mainAxisExtent: 140.h,
                        mainAxisSpacing: 5.h,
                        crossAxisSpacing: 5.h),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(electronicsProductsUnder300$[index].image);
                    },
                  ),
                ),
                Text(
                  'Sea all daels',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            );
          }
          return ErrorWidget('Something went wrong');
        },
      ),
    );
  }
}
