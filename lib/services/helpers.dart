import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logistic/controllers/contacts_controller.dart';
import 'package:logistic/controllers/create_order_controller.dart';
import 'package:logistic/controllers/profile_controller.dart';
import 'package:logistic/data/repository/auth_repo.dart';
import 'package:logistic/data/repository/contacts_repo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/auth_controller.dart';
import 'package:logistic/controllers/localizationController.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:logistic/services/localStorage.dart';

Future initControllers() async {
  await Get.put(LocalStorage()).load();
  Get.put(ApiClient());

  //Repositories
  Get.put(AuthRepo());
  Get.put(ContactsRepo());

  // Controller
  Get.put(LocalizationController());
  Get.put(AuthController());
  Get.put(ProfileController());
  Get.put(ContactsController());
  Get.put(CreateOrderController());
}

void showToast(String msg, {bool isError = false}) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
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
