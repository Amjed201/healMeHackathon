import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:logistic/data/api/api_checker.dart';
import 'package:logistic/data/models/order.dart';
import 'package:logistic/data/models/user.dart';
import 'package:logistic/data/repository/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:logistic/data/repository/orders_repo.dart';
import 'package:logistic/services/helpers.dart';
import 'package:logistic/services/localStorage.dart';
import 'package:logistic/ui/screens/auth/complete_info.dart';
import 'package:logistic/ui/screens/auth/login.dart';
import 'package:logistic/ui/screens/auth/otp.dart';
import 'package:logistic/ui/screens/tabs_screen.dart';

class MyOrdersController extends GetxController {
  final myOrdersRepo = Get.find<MyOrdersRepo>();
  final storage = Get.find<LocalStorage>();

  bool _loading = false;

  bool get loading => _loading;

  List<Order> _runningOrders = [];

  List<Order> get runningOrders => _runningOrders;

  List<Order> _previousOrders = [];

  List<Order> get previousOrders => _previousOrders;


  void getOrders(){
    getRunningOrders();
    getPreviousOrders();
  }

  Future<void> getRunningOrders() async {
    _loading = true;
    update();
    http.Response response =
        await myOrdersRepo.getRunningOrders(token: storage.getToken()!);
    if (response.statusCode == 200) {
      Map jsonMap = json.decode(response.body);
      List dataList = jsonMap["orders"];
      _runningOrders = dataList.map((e) => Order.fromJson(e)).toList();
      _loading = false;
      update();
      Get.back();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }

  void getPreviousOrders() async {
    _loading = true;
    update();
    http.Response response =
        await myOrdersRepo.getPreviousOrders(token: storage.getToken()!);
    if (response.statusCode == 200) {
      Map jsonMap = json.decode(response.body);
      List dataList = jsonMap["orders"];
      _previousOrders = dataList.map((e) => Order.fromJson(e)).toList();
      _loading = false;
      update();
      Get.back();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }
}
