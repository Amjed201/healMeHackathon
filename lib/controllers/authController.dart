import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/cartController.dart';
import 'package:logistic/controllers/profileController.dart';
import 'package:logistic/models/user.dart';
import 'package:logistic/services/apiService.dart';
import 'package:logistic/services/localStorage.dart';
import 'package:logistic/ui/screens/splash.dart';
import 'configController.dart';
import 'orderController.dart';

class AuthController extends GetxController {
  bool _termsAccepted = false;
  bool _termsAndPass = false;
  bool _obscure = false;
  bool _loading = false;
  late String _phone;
  User? _user;

  set user(User? value) {
    _user = value;
    update();
  }

  bool get termsAccepted => _termsAccepted;

  bool get termsAndPass => _termsAndPass;

  bool get obscure => _obscure;

  bool get loading => _loading;

  String get phone => _phone;

  User? get user => _user;

  final api = Get.find<ApiService>();

  getUserProfile(BuildContext context) async {
    try {
      _user = await api.getProfile(context);
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  clearUser(bool isLogout) async {
    _user = null;
    Get.find<LocalStorage>().clearAll();
    // Get.find<OrderController>().orders = [];
    Get.find<CartController>().cartItems = [];
    Get.find<ProfileController>().image = null;
    if (isLogout) {
      Get.offAll(() => const SplashScreen());
    }
  }

  // toggleTerms() {
  //   _termsAccepted = !_termsAccepted;
  //   update();
  // }

  toggleObscure() {
    _obscure = !_obscure;
    update();
  }

  checkPassAndTerms(String pass, String rePass) {
    if (pass == rePass
        // && _termsAccepted
    ) {
      _termsAndPass = true;
    } else
      _termsAndPass = false;
    update();
  }

  sendOtp({required String phone, required BuildContext context}) async {
    try {
      _phone = phone;
      _loading = true;
      update();
      bool status = await api.sendOtp(phone, context);
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  checkOtp({required String code, required BuildContext context}) async {
    try {
      _loading = true;
      update();
      List response = await api.checkOtp(
        phone,
        code,
        context,
      );
      if (response.first) {
        Get.find<ConfigController>().pageIndex = 0;
      }
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  addPassword({required String password, required BuildContext context}) async {
    try {
      _loading = true;
      update();
      bool status = await api.addPassword(password, context);
      Get.find<ConfigController>().pageIndex = 0;
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  // updateUser({required UpdateUser user, required BuildContext context}) async {
  //   try {
  //     _loading = true;
  //     update();
  //     bool status = await api.updateUser(user, context);
  //     _loading = false;
  //     update();
  //   } catch (e) {
  //     print(e.toString());
  //     _loading = false;
  //     update();
  //   }
  // }

  updateFcmToken({required BuildContext context}) async {
    try {
      await api.updateFirebaseID(context);
    } catch (e) {
      print(e.toString());
    }
  }
}
