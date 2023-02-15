import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_amazon_app/core/constants/constants.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_amazon_app/features/product/data/repository/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository(this._firebaseFirestore);
  @override
  Future<List<Product>> getAllProducts() async {
    List<Product> products = [];
    try {
      QuerySnapshot<Map<String, dynamic>> collection =
          await _firebaseFirestore.collection(productsCollection).get();
      products = collection.docs
          .map((product) => Product.fromJson(product.data()))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
    }
    return products;
  }
}
