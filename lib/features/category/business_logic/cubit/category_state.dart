part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoriesLoaded extends CategoryState{
  final List<Category>categories;
  CategoriesLoaded(this.categories);
}
class CategoriesLoading extends CategoryState {
  
}