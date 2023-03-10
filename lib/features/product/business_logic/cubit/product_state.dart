part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}
class Productloading extends ProductState {}
class ProductLoaded extends ProductState {
  final List<Product>products;
  ProductLoaded(this.products);
}