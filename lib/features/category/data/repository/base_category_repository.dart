import 'package:flutter_amazon_app/features/category/data/model/category.dart';

abstract class BaseCategoryRepository{
  Future<List<Category>>getAllCategories();
}