import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:logistic/data/api/api_checker.dart';
import 'package:logistic/data/models/bid.dart';
import 'package:logistic/data/models/bid.dart';
import 'package:logistic/data/models/order.dart';
import 'package:logistic/data/models/user.dart';
import 'package:logistic/data/repository/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:logistic/data/repository/bid_repo.dart';
import 'package:logistic/data/repository/orders_repo.dart';
import 'package:logistic/services/helpers.dart';
import 'package:logistic/services/localStorage.dart';
import 'package:logistic/ui/screens/auth/complete_info.dart';
import 'package:logistic/ui/screens/auth/login.dart';
import 'package:logistic/ui/screens/auth/otp.dart';
import 'package:logistic/ui/screens/tabs_screen.dart';

class BidController extends GetxController {
  final bidRepo = Get.find<BidRepo>();
  final storage = Get.find<LocalStorage>();

  bool _loading = false;

  bool get loading => _loading;

  List<Bid> _bids = [];

  List<Bid> get bids => _bids;




  Future<void> getBids(int orderId) async {
    _loading = true;
    update();
    http.Response response =
    await bidRepo.getBidsForOrder(orderId: orderId,token: storage.getToken()!);
    if (response.statusCode == 200) {
      List dataList = json.decode(response.body);
      _bids = dataList.map((e) => Bid.fromJson(e)).toList();
      _loading = false;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }


  Future<void> acceptOrder({required int orderId,required int bidId}) async {
    _loading = true;
    update();
    http.Response response =
    await bidRepo.acceptBidForOrder(orderId: orderId,bidId: bidId,token: storage.getToken()!);
    if (response.statusCode == 200) {
      _loading = false;
      update();
      showToast('addedSuccess'.tr);
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }

}
