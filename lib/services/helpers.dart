import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logistic/controllers/Location_controller.dart';
import 'package:logistic/controllers/bid_controller.dart';
import 'package:logistic/controllers/contacts_controller.dart';
import 'package:logistic/controllers/create_order_controller.dart';
import 'package:logistic/controllers/my_orders_controller.dart';
import 'package:logistic/controllers/order_status_controller.dart';
import 'package:logistic/controllers/profile_controller.dart';
import 'package:logistic/controllers/zone_controller.dart';
import 'package:logistic/data/repository/auth_repo.dart';
import 'package:logistic/data/repository/bid_repo.dart';
import 'package:logistic/data/repository/contacts_repo.dart';
import 'package:logistic/data/repository/create_order_repo.dart';
import 'package:logistic/data/repository/orders_status_repo.dart';
import 'package:logistic/data/repository/zone_repo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/auth_controller.dart';
import 'package:logistic/controllers/localizationController.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:logistic/services/localStorage.dart';

import '../data/repository/my_orders_repo.dart';

Future initControllers() async {
  await Get.put(LocalStorage()).load();
  Get.put(ApiClient());

  //Repositories
  Get.put(AuthRepo());
  Get.put(ContactsRepo());
  Get.put(ZoneRepo());
  Get.put(MyOrdersRepo());
  Get.put(OrderStatusRepo());
  Get.put(CreateOrderRepo());
  Get.put(BidRepo());

  // Controller
  Get.put(LocalizationController());
  Get.put(AuthController());
  Get.put(ProfileController());
  Get.put(ContactsController());
  Get.put(ZoneController());
  Get.put(MyOrdersController());
  Get.put(OrderStatusController());
  Get.put(CreateOrderController());
  Get.put(LocationController());
  Get.put(BidController());
}

void showToast(String msg,
        {bool longerDuration = false, bool isError = false}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: longerDuration ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: isError ? Colors.red[800] : const Color(0xff387E7E),
        textColor: Colors.white,
        fontSize: 16.0);

void launchPhone(String url) async {
  if (!await launch('tel:' + url)) throw 'Could not launch $url';
}

void launchEmail(String url) async {
  if (!await launch('mailto:' + url)) throw 'Could not launch $url';
}

void launchMap(String lat, String lng) async {
  if (!await launch(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lng'))
    throw 'Could not launch google map';
}

void launchUrl(String url) async {
  if (url.contains('https://')) {
    await launch(url);
  } else {
    if (!await launch('https://' + url)) throw 'Could not launch $url';
  }
}
