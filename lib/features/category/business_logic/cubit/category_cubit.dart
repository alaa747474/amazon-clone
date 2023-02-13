import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazon_app/features/category/data/repository/category_repository.dart';
import '../../data/model/category.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepository) : super(CategoryInitial());
 final CategoryRepository _categoryRepository;
  getAllCategories(){
    try {
      emit(CategoriesLoading());
      _categoryRepository.getAllCategories().then((value) {
     
        emit(CategoriesLoaded(value));
    });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
