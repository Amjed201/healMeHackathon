import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistic/services/apiService.dart';
import 'package:logistic/services/localStorage.dart';
import 'package:logistic/ui/screens/splash.dart';

class AuthController extends GetxController {
  bool _loading = false;
  late String _phone;
  // User? _user;
  //
  // set user(User? value) {
  //   _user = value;
  //   update();
  // }


  bool get loading => _loading;

  String get phone => _phone;

  // User? get user => _user;

  final api = Get.find<ApiService>();

  getUserProfile(BuildContext context) async {

  }

  clearUser(bool isLogout) async {
    // _user = null;
    Get.find<LocalStorage>().clearAll();
    // Get.find<OrderController>().orders = [];
    if (isLogout) {
      Get.offAll(() => const SplashScreen());
    }
  }
  updateFcmToken({required BuildContext context}) async {
    try {
      // await api.updateFirebaseID(context);
    } catch (e) {
      print(e.toString());
    }
  }
}
