import 'package:flutter_amazon_app/features/product/data/model/product.dart';

abstract class BaseProductRepository {
  Future<List<Product>>getAllProducts();
}