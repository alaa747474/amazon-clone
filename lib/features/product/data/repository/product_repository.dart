import 'package:flutter_amazon_app/core/constants/constants.dart';
import 'package:flutter_amazon_app/core/utils/firestore_service.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_amazon_app/features/product/data/repository/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final CollectionNames _collectionNames=CollectionNames.instance;
  @override
  Future<List<Product>> getAllProducts() async {
    return FireStoreService.instance.getCollectionData(
        collection: _collectionNames.productsCollection,
        builder: (data) => Product.fromJson(data!));
  }
}
