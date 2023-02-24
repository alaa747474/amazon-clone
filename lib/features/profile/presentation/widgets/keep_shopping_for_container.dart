import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/product/business_logic/cubit/product_cubit.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeepShoppingForContainer extends StatelessWidget {
  const KeepShoppingForContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          height: 400.h,
          color: Theme.of(context).primaryColorLight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Keep shopping for',style: Theme.of(context).textTheme.headline2),
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 140.r,
                    crossAxisSpacing: 15.r,
                  ),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    if (state is Productloading) {
                      return const LoadingIndicator();
                    }
                     if (state is ProductLoaded) {
                      return InkWell(
                        onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName,arguments:state.products[index] ),
                        child: Column(
                          children: [
                            Container(
                              height: 100.h,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorLight,
                                borderRadius: BorderRadius.circular(5.r),
                                boxShadow: [BoxShadow(
                                  spreadRadius: 1,
                                  color: Theme.of(context).hintColor
                                ),
                                
                                ]
                              ),
                              child: Center(
                                child: Image.network(state.products[index].image,),
                              ),
                             ),
                              Text(state.products[index].name,style: Theme.of(context).textTheme.headline6,overflow: TextOverflow.ellipsis,)
                          ],
                        ),
                      );
                     }
                     return ErrorWidget('Something went wrong');
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
