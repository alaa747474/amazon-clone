import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_amazon_app/core/constants/constants.dart';
import 'package:flutter_amazon_app/features/order/data/model/order_model.dart';
import 'package:flutter_amazon_app/features/order/data/repository/base_order_repositoey.dart';

class OrderRepository extends BaseOrderRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  OrderRepository(this._firebaseFirestore, this._firebaseAuth);
  @override
  Future<void> orderConfirmation({required OrderModel orderModel}) async {
    await _firebaseFirestore
        .collection(usersCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('orders')
        .doc()
        .set(orderModel.toJson());
  }
}
