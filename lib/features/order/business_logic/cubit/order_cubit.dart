import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_amazon_app/features/order/data/model/order_model.dart';
import 'package:flutter_amazon_app/features/order/data/repository/order_repositoey.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._orderRepository) : super(OrderInitial());
  final OrderRepository _orderRepository;
  
  orderConfirmation({required OrderModel orderModel})async{
  
    try {
      emit(OrderConfirmationLoading());
      await _orderRepository.orderConfirmation(orderModel: orderModel).then((value) {
         emit(OrderConfirmationDone());
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
