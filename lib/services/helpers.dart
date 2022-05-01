import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logistic/controllers/notificationController.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/authController.dart';
import 'package:logistic/controllers/cartController.dart';
import 'package:logistic/controllers/configController.dart';
import 'package:logistic/controllers/favoriteController.dart';
import 'package:logistic/controllers/localizationController.dart';
import 'package:logistic/controllers/mapController.dart';
import 'package:logistic/controllers/offerController.dart';
import 'package:logistic/controllers/orderController.dart';
import 'package:logistic/controllers/payment_controller.dart';
import 'package:logistic/controllers/profileController.dart';
import 'package:logistic/services/apiService.dart';
import 'package:logistic/services/localStorage.dart';

Future initControllers() async {
  // Controller
  await Get.put(LocalStorage()).load();
  Get.put(LocalizationController());
  Get.put(ApiService());
  Get.put(OffersController());
  Get.put(CartController());
  Get.put(AuthController());
  Get.put(ProfileController());
  Get.put(OrderController());
  Get.put(FavoriteController());
  Get.put(MapController());
  Get.put(PaymentController());
  Get.put(ConfigController());
  Get.put(NotificationController());
}

void showToast(String msg, BuildContext context, {Color? color}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color ?? Theme.of(context).secondaryHeaderColor,
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
