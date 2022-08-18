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

class OrderStatusController extends GetxController {
  final orderStatusRepo = Get.find<OrderStatusRepo>();
  final storage = Get.find<LocalStorage>();

  bool _loading = false;

  bool get loading => _loading;


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
