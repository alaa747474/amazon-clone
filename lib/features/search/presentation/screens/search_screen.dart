import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/custom_app_bar.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/product/business_logic/cubit/product_cubit.dart';
import 'package:flutter_amazon_app/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter_amazon_app/features/search/business_logic/cubit/search_cubit.dart';
import 'package:flutter_amazon_app/features/search/presentation/widgets/search_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String routeName = '/search_screen';
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
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
                Flexible(child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoaded) {
                      return SearchField(
                        clearSearchMethod: () {
                          setState(() {
                            searchController.clear();
                          });
                        },
                        searchController: searchController,
                        onChanged: (typedText) {
                          context.read<SearchCubit>().seatchFilter(
                              typedText: typedText,
                              searchedList: state.products);
                          if (searchController.text.isEmpty) {
                            context.read<SearchCubit>().clearList();
                          }
                        },
                      );
                    }
                    return const LoadingIndicator();
                  },
                )),
              ],
            ),
          ),
          body: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoaded) {
                return ListView.builder(
                  itemCount: state.filtered.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, ProductDetailsScreen.routeName,
                          arguments: state.filtered[index]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 10.w),
                        child: Text(
                          state.filtered[index].name,
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 1,
                        ),
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        );
      },
    );
  }
}
