
import 'package:equatable/equatable.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';

class Cart extends Equatable{
final List<Product>cartProducts;
  const Cart(this.cartProducts);
  
  double get total=> cartProducts.fold(0, (previousValue, products) => previousValue+products.price);

 
  @override

  List<Object?> get props => [cartProducts];

}
