
import 'package:flutter_amazon_app/features/product/data/model/product.dart';

abstract class BaseCartRepository{
  Future<void>addProductToCart({required Product product});
  Future<void>removeProductFromCart({required Product product});
  Future<List<Product>> getCartProducts();
}