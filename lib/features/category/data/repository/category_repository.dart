import 'package:flutter_amazon_app/core/constants/constants.dart';
import 'package:flutter_amazon_app/core/utils/firestore_service.dart';
import 'package:flutter_amazon_app/features/category/data/repository/base_category_repository.dart';
import 'package:flutter_amazon_app/features/category/data/model/category.dart';

class CategoryRepository extends BaseCategoryRepository {
  final CollectionNames _collectionNames=CollectionNames.instance;
  @override
  Future<List<Category>> getAllCategories() async {
    return FireStoreService.instance.getCollectionData(
        collection: _collectionNames.categoriesCollection,
        builder: (data) => Category.fromJson(data!));
  }
}
