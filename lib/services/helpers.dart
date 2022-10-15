import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healMe/controllers/appointment_controller.dart';
import 'package:healMe/controllers/quickTest_controller.dart';
import 'package:healMe/data/repository/appointment_repo.dart';
import 'package:healMe/data/repository/auth_repo.dart';
import 'package:healMe/data/repository/quickTest_repo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:healMe/controllers/auth_controller.dart';
import 'package:healMe/controllers/localizationController.dart';
import 'package:healMe/data/api/apiService.dart';
import 'package:healMe/services/localStorage.dart';

Future initControllers() async {
  await Get.put(LocalStorage()).load();
  Get.put(ApiClient());

  //Repositories
  Get.put(AuthRepo());
  Get.put(QuickTestRepo());
  Get.put(AppointmentRepo());

  // Controller
  Get.put(LocalizationController());
  Get.put(AuthController());
  Get.put(QuickTestController());
  Get.put(AppointmentController());
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
