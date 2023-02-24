import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/core/widgets/custom_search_field.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/category/business_logic/cubit/category_cubit.dart';
import 'package:flutter_amazon_app/features/category/presentation/widgets/best_seller_category_container.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/products_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerCategoryScreen extends StatelessWidget {
  const BestSellerCategoryScreen({super.key});
  static const String routeName = '/best_seller_category_screen';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
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
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoriesLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BestSellerCategoryContainer(
                        index: index,
                        category: state.categories[index],
                      );
                    },
                  ),
                ),
              ],
            );
          }
          if (state is CategoriesLoading) {
            return const LoadingIndicator();
          }
          return ErrorWidget('somthing went wrong');
        },
      ),
    );
  }
}
