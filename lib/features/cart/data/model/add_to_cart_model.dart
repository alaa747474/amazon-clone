
import 'package:flutter_amazon_app/features/product/data/model/product.dart';

class AddToCartModel {
final Product product;
int quantity=1;

  AddToCartModel(this.product,this.quantity);

  Map<String, dynamic> toMap() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  factory AddToCartModel.fromMap(Map<String, dynamic> map) {
    return AddToCartModel(
      Product.fromJson(map['product']),
      map['quantity'],
    );
  }

}
