import 'package:bloc/bloc.dart';
import 'package:flutter_amazon_app/features/cart/data/model/cart.dart';
import 'package:flutter_amazon_app/features/cart/data/repository/cart_repository.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepository) : super(CartInitial());
  final CartRepository _cartRepository;
  
   Map cartProductQuantity(List<Product>products){
    Map quantity={};
    for (var product in products) {
      if (!quantity.containsKey(product.id)) {
        quantity[product.id]=1;
      }else{
        quantity[product.id]+=1;
      }
    }
    return quantity;
  }

  addToCart({required Product product}){
    _cartRepository.addProductToCart(product: product).then((value) {
     emit(ProductAddedToCart());
      getCartProducts();
    });
  }
  removeFromCart({required Product product}){
    _cartRepository.removeProductFromCart(product: product).then((value) {
      emit(ProductRemovedFromCart());
       getCartProducts();
    });
  }
  deleteAllProductQuantities({required Product product}){
    _cartRepository.deleteAllProductQuantities(product: product).then((value) {
      emit(ProductRemovedFromCart());
       getCartProducts();
    });
  }
  
  getCartProducts(){
    _cartRepository.getCartProducts().then((value) {
      emit(CartProductsLoaded(Cart(value)));
    });
  }
  deleteCart(){
    _cartRepository.deleteCart();
    emit(getCartProducts());
  }
}
