import 'package:flutter_amazon_app/core/constants/constants.dart';
import 'package:flutter_amazon_app/core/utils/firestore_service.dart';
import 'package:flutter_amazon_app/features/order/data/model/order_model.dart';
import 'package:flutter_amazon_app/features/order/data/repository/base_order_repositoey.dart';

class OrderRepository extends BaseOrderRepository {

  final CollectionNames _collectionNames = CollectionNames.instance;
  @override
  Future<void> orderConfirmation({required OrderModel orderModel}) async {
    FireStoreService.instance.addData(
        firstCollection: _collectionNames.usersCollection,
        secondCollection: _collectionNames.orederCollection,
        data: orderModel.toJson());
  }
}
