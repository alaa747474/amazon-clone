part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class ProductAddedToCart extends CartState {}
class ProductRemovedFromCart extends CartState {}
class CartProductsLoaded extends CartState {
  final Cart cartProducts;

  CartProductsLoaded(this.cartProducts);
}
