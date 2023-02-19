import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_amazon_app/core/constants/constants.dart';
import 'package:flutter_amazon_app/features/cart/data/repository/base_cart_repository.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';

class CartRepository extends BaseCartRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  CartRepository(this._firebaseFirestore, this._firebaseAuth);
  @override
  Future<void> addProductToCart({required Product product}) async {
    
    await _firebaseFirestore
        .collection(usersCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(cartCollection)
        .doc(product.id)
        .set(product.toJson());
  }

  @override
  Future<void> removeProductFromCart({required Product product}) async {

    await _firebaseFirestore
        .collection(usersCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(cartCollection)
        .doc(product.id)
        .delete();
  }

  @override
  Future<List<Product>> getCartProducts() async {
 
    var collection = await _firebaseFirestore
        .collection(usersCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(cartCollection)
        .get();

    return collection.docs.map((e) => Product.fromJson(e.data())).toList();
    
  }
}
