import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:logistic/data/api/api_checker.dart';
import 'package:logistic/data/models/user.dart';
import 'package:logistic/data/repository/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:logistic/services/helpers.dart';
import 'package:logistic/services/localStorage.dart';
import 'package:logistic/ui/screens/auth/complete_info.dart';
import 'package:logistic/ui/screens/auth/login.dart';
import 'package:logistic/ui/screens/auth/otp.dart';
import 'package:logistic/ui/screens/splash.dart';
import 'package:logistic/ui/screens/splash.dart';
import 'package:logistic/ui/screens/tabs_screen.dart';

class AuthController extends GetxController {
  final authRepo = Get.find<AuthRepo>();
  final storage = Get.find<LocalStorage>();

  bool _loading = false;

  bool get loading => _loading;

  String _phone = '';

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
    update();
  }

  // User? _user;
  //
  // set user(User? value) {
  //   _user = value;
  //   update();
  // }

  // User? get user => _user;

  void sendOtp({required String countryCode, required String phone}) async {
    _loading = true;
    update();
    http.Response response =
        await authRepo.sendOtp(countryCode: countryCode, phone: phone);
    if (response.statusCode == 200) {
      Map responseMap = json.decode(response.body);
      showToast(responseMap["code"]);
      Get.to(() => OtpScreen());
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }

  void checkOtp(
      {required String countryCode,
      required String phone,
      required String otp}) async {
    _loading = true;
    update();
    http.Response response = await authRepo.confirmOtp(
        countryCode: countryCode, phone: phone, otp: otp);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      storage.setToken(responseMap["token"]);
      User user = User.fromJson(responseMap["user"]);
      storage.setUser(user);
      _loading = false;
      update();
      //check whether the user have registered or not
      Get.offAll(() => user.fullName == null ? InfoScreen() : SplashScreen());
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }

  void registerUser({
    required String name,
     String? email,
  }) async {
    _loading = true;
    update();
    http.Response response = await authRepo.register(
        name: name, email: email, token: storage.getToken()!);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      User user = User.fromJson(responseMap);
      storage.setUser(user);
      _loading = false;
      update();
      Get.offAll(() => SplashScreen());
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }

  void logout() {
    Get.defaultDialog(
      title: 'sureLogout'.tr,
      content: const SizedBox(),
      cancel: InkWell(
        onTap: () => Get.back(),
        child: Text(
          'no'.tr,
        ),
      ),
      confirm: InkWell(
          onTap: () {
            Get.find<LocalStorage>().clearAll();
            Get.offAll(LoginScreen());
          },
          child: Text('yes'.tr, style: const TextStyle(color: Colors.red))),
    );
  }
}
