import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/product/business_logic/cubit/product_cubit.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/products_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({
    Key? key, required this.category, required this.price,
  }) : super(key: key);
  final String category;
  final double price;
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
            final discountProducts = state.products
                .where((element) => element.category==category && element.price<price)
                .toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$category Under $price\$',
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
                      return Image.network(discountProducts[index].image);
                    },
                  ),
                ),
                InkWell(
                  onTap: ()=>Navigator.pushNamed(context, ProductsScreen.routeName,arguments: discountProducts),
                  child: Text(
                    'Sea more',
                    style: Theme.of(context).textTheme.headline5,
                  ),
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
