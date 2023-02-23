import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/product/business_logic/cubit/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeepShoppingForContainer extends StatelessWidget {
  const KeepShoppingForContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Container(
          height: 320.h,
          color: Theme.of(context).primaryColorLight,
          child: GridView.builder(
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 120.r,
              crossAxisSpacing: 25.r,
              mainAxisSpacing: 25.r
            ),
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) {
              if (state is Productloading) {
                return const LoadingIndicator();
              }
               if (state is ProductLoaded) {
                return Container(
                  
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(5.r),
                    boxShadow: [BoxShadow(
                      spreadRadius: 0.1,
                      offset: const Offset(-1,-1),
                      
                      color: Theme.of(context).shadowColor.withOpacity(0.2)
                    ),
                    BoxShadow(
                      spreadRadius: 0.1,
                      offset: const Offset(1,1),
                      
                      color: Theme.of(context).shadowColor.withOpacity(0.2)
                    )
                    ]
                  ),
                
                  child: Center(
                    child: Image.network(state.products[index].image),
                  ),
                 );
               }
               return ErrorWidget('Something went wrong');
            },
          ),
        );
      },
    );
  }
}
