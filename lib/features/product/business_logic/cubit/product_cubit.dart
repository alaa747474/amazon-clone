import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:flutter_amazon_app/features/product/data/repository/product_repository.dart';


part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepository) : super(ProductInitial());
  final ProductRepository _productRepository;
  getAllProducts(){
    try {
      emit(Productloading());
      _productRepository.getAllProducts().then((products) {
        emit(ProductLoaded(products));
    } );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
