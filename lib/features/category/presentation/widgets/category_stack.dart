import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/core/widgets/loading_indicator.dart';
import 'package:flutter_amazon_app/features/category/business_logic/cubit/category_cubit.dart';
import 'package:flutter_amazon_app/features/category/presentation/widgets/category_container.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryStack extends StatelessWidget {
  const CategoryStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.7,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.network('https://images.pexels.com/photos/1337247/pexels-photo-1337247.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',              ),
          Positioned(
            top: 100,left: 20,
            child: Text('Essentials \nfor Games',style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white),)),
            Positioned(
              top: MediaQuery.of(context).size.height*0.42,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 250,
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                     if (state is CategoriesLoading) {
                                  return const LoadingIndicator();
                                }
                    if (state is CategoriesLoaded) {
                     return ListView.builder(
                                itemCount: state.categories.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  return CategoryContainer(categoryImage: state.categories[index].image,categoryName: state.categories[index].name);
                              }));
                    }
                    return const Text('data');
                  },
                ),
              )),
        ],
      ),
    );
  }
}