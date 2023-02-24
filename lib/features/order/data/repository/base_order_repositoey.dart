import 'package:flutter_amazon_app/features/order/data/model/order_model.dart';

abstract class BaseOrderRepository {
  Future<void>orderConfirmation({required OrderModel orderModel});
}