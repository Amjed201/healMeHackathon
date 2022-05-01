import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/cartController.dart';
import 'package:logistic/models/order.dart' as order;
import 'package:logistic/models/requests/addOrder.dart';
import 'package:logistic/services/apiService.dart';

class OrderController extends GetxController {
  bool _loading = false;
  bool _status = false;
  int _page = 0;

  int get page => _page;

  set page(int value) {
    _page = value;
  }

  List<order.Order> _orders = [];
  List<order.Order> _ordersHistory = [];

  List<order.Order> get orders => _orders;

  List<order.Order> get ordersHistory => _ordersHistory;

  set orders(List<order.Order> value) {
    _orders = value;
  }

  set ordersHistory(List<order.Order> value) {
    _ordersHistory = value;
  }

  bool get status => _status;

  bool get loading => _loading;

  final api = Get.find<ApiService>();

  addOrder({required BuildContext context, required AddOrder order}) async {
    try {
      _loading = true;
      update();
      _status = await api.addOrder(context, order);
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  Future<List<order.Order>> myOrders({required BuildContext context}) async {
    try {
      _loading = true;
      update();
      _orders = await api.myOrders(context, 1);
      _loading = false;
      update();
      return _orders;
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
      return [];
    }
  }

  Future<List<order.Order>> myOrderHistory(
      {required BuildContext context}) async {
    try {
      _loading = true;
      update();
      _ordersHistory = await api.myOrderHistory(context, 1);
      _loading = false;
      update();
      return _ordersHistory;
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
      return [];
    }
  }

  void sendOrder(BuildContext context, int paymentId, {String? promo}) async {
    final items = Get.find<CartController>().cartItems;
    List<OrderItem> orderItems = [];
    for (var element in items) {
      orderItems.add(
          OrderItem(offerItemId: element.offer.id, quantity: element.quantity));
    }
    AddOrder order = AddOrder(
        orderItems: orderItems, promoCode: promo, paymentId: paymentId);
    await addOrder(context: context, order: order);
    if (status) {
      Get.find<CartController>().clearCart();
      Get.find<CartController>().discount = 0;
      myOrders(context: context);
    }
  }

  Future<String> rateOrder({
    required BuildContext context,
    required int orderId,
    required double rateValue,
    required String comment,
  }) async {
    try {
      _loading = true;
      update();
      final responseMsg =
          await api.rateOrder(context, orderId, rateValue, comment);
      _loading = false;
      update();
      return responseMsg;
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
      return 'error occurred';
    }
  }

  void checkOrderStatus({order.Order? selectedOrder}) {
    print('order status id: ${selectedOrder?.orderStatus?.id}');
    if (selectedOrder?.orderStatus?.id == 1 &&
        selectedOrder?.paymentMethod?.id == 1) {
    } else if (selectedOrder?.orderStatus?.id == 2) {
    }
  }
}
