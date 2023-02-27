import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_amazon_app/core/constants/constants.dart';
import 'package:flutter_amazon_app/core/utils/firestore_service.dart';
import 'package:flutter_amazon_app/features/cart/data/repository/base_cart_repository.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';
import 'package:uuid/uuid.dart';

class CartRepository extends BaseCartRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  final CollectionNames _collectionNames=CollectionNames.instance;
  CartRepository(this._firebaseFirestore, this._firebaseAuth);
  @override
  Future<void> addProductToCart({required Product product}) async {
    product.uid = const Uuid().v1();
    await FireStoreService.instance.addData(
        firstCollection: _collectionNames.usersCollection,
        secondCollection: _collectionNames.cartCollection,
        data: product.toJson());
  }

  @override
  Future<void> removeProductFromCart({required Product product}) async {
    var query = _firebaseFirestore
        .collection(_collectionNames.usersCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(_collectionNames.cartCollection)
        .where('uid', isEqualTo: product.uid);
    await query.get().then((value) {
      for (var element in value.docs) {
        _firebaseFirestore
            .collection(_collectionNames.usersCollection)
            .doc(_firebaseAuth.currentUser!.uid)
            .collection(_collectionNames.cartCollection)
            .doc(element.id)
            .delete();
      }
    });
  }

  @override
  Future<List<Product>> getCartProducts() async {
    return FireStoreService.instance.getSubCollectionData(
        firstCollection: _collectionNames.usersCollection,
        secondCollection: _collectionNames.cartCollection,
        builder: (data) => Product.fromJson(data!));
  }

  @override
  Future<void> deleteAllProductQuantities({required Product product}) async {
    var query = _firebaseFirestore
        .collection(_collectionNames.usersCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(_collectionNames.cartCollection)
        .where('id', isEqualTo: product.id);
    await query.get().then((value) {
      for (var element in value.docs) {
        _firebaseFirestore
            .collection(_collectionNames.usersCollection)
            .doc(_firebaseAuth.currentUser!.uid)
            .collection(_collectionNames.cartCollection)
            .doc(element.id)
            .delete();
      }
    });
  }

  @override
  Future<void> deleteCart() async {
    var query = _firebaseFirestore
        .collection(_collectionNames.usersCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(_collectionNames.cartCollection);
    await query.get().then((value) {
      for (var element in value.docs) {
        element.reference.delete();
      }
    });
  }
}
