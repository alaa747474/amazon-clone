import 'package:flutter/material.dart';

import 'package:flutter_amazon_app/features/product/business_logic/cubit/product_cubit.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestionProductsContainer extends StatelessWidget {
  const SuggestionProductsContainer(
      {super.key, required this.category, required this.currentProductId});
  final String category;
  final String currentProductId;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      color: Colors.white,
      height: 280.h,
      width: double.infinity,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            final suggestionList = state.products
                .where((element) =>
                    element.category == category &&
                    element.id != currentProductId)
                .toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You might also like',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: suggestionList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: ()=>Navigator.pushNamed(context, ProductDetailsScreen.routeName,arguments: suggestionList[index]),
                        child: SizedBox(
                          width: 150.w,
                          child: Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Center(
                                        child: Image.network(
                                      suggestionList[index].image,
                                      width: 150.w,
                                      height: 150.h,
                                      fit: BoxFit.scaleDown,
                                    )),
                                    Text(
                                      suggestionList[index].name,
                                      style:
                                          Theme.of(context).textTheme.titleMedium,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                                Text('\$${suggestionList[index].price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(color: Colors.red[700]))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return ErrorWidget('Opps!!! something went wrong');
        },
      ),
    );
  }
}
