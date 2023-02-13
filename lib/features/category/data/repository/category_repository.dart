import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_amazon_app/core/constants/constants.dart';
import 'package:flutter_amazon_app/features/category/data/repository/base_category_repository.dart';
import 'package:flutter_amazon_app/features/category/data/model/category.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository(this._firebaseFirestore);
  @override
  Future<List<Category>> getAllCategories()async {
  var categories=await _firebaseFirestore.collection(categoriesCollection).get();
  return categories.docs.map((e) => Category.fromJson(e.data())).toList();
  
  }
  
}