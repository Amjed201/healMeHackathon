import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/my_orders_controller.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:logistic/data/api/api_checker.dart';
import 'package:logistic/data/models/order.dart';
import 'package:logistic/data/models/user.dart';
import 'package:logistic/data/repository/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:logistic/data/repository/my_orders_repo.dart';
import 'package:logistic/data/repository/orders_status_repo.dart';
import 'package:logistic/services/helpers.dart';
import 'package:logistic/services/localStorage.dart';
import 'package:logistic/ui/screens/auth/complete_info.dart';
import 'package:logistic/ui/screens/auth/login.dart';
import 'package:logistic/ui/screens/auth/otp.dart';
import 'package:logistic/ui/screens/tabs_screen.dart';

//('Created','PendingStart','Started','GoingToPickup','PendingLoadIn',
// 'PendingPaymentOnPickup','Loaded','GoingToDropOff','PendingPaymentOnDropOff',
// 'PendingLoadOff','Completed','Canceled')

enum OrderStatus{
  pending,
}

class OrderStatusController extends GetxController {
  final orderStatusRepo = Get.find<OrderStatusRepo>();
  final storage = Get.find<LocalStorage>();

  bool _loading = false;

  bool get loading => _loading;


  String getOrderStatus(String status){
    switch (status){
      case 'PendingStart' : return 'waitingDriver'.tr;
      case 'PendingLoadIn' : return 'confirmLoadIn'.tr;
      case 'PendingLoadOff' : return 'confirmLoadOff'.tr;
      default : return 'waitingDriver'.tr;
    }
  }


  void changeOrderStatus({required int orderId,required String orderStatus,String? reason}) async {
    if(orderStatus == 'PendingLoadIn' || orderStatus == 'PendingLoadOff') {
      _loading = true;
      update();
      http.Response response = await orderStatusRepo.changeOrderStatus(
          orderId: orderId,
          status: orderStatus,
          token: storage.getToken()!);
      if (response.statusCode == 200) {
        _loading = false;
        update();
        showToast('orderUpdated'.tr);
        //Todo: get order details
      } else {
        ApiChecker.checkApi(response);
      }
      _loading = false;
      update();
    }
  }

  void cancelOrder({required int orderId, String? reason}) async {
    _loading = true;
    update();
    http.Response response = await orderStatusRepo.cancelOrder(
        orderId: orderId,
        reason: reason ?? 'no reason selected',
        token: storage.getToken()!);
    if (response.statusCode == 200) {
      _loading = false;
      update();
      showToast('orderCancelled'.tr,isError: true);
      Get.offAll(() => TabsScreen());
      Get.find<MyOrdersController>().getRunningOrders();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }
}
