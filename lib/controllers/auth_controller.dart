import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healMe/data/api/apiService.dart';
import 'package:healMe/data/api/api_checker.dart';
import 'package:healMe/data/models/user.dart';
import 'package:healMe/data/repository/auth_repo.dart';
import 'package:healMe/ui/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:healMe/services/helpers.dart';
import 'package:healMe/services/localStorage.dart';
import 'package:healMe/ui/screens/auth/complete_info.dart';
import 'package:healMe/ui/screens/auth/login.dart';
import 'package:healMe/ui/screens/auth/otp.dart';
import 'package:healMe/ui/screens/splash_screen.dart';

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


  void registerUser({
    required String name,
    required String? email,
    required String? phone,
    required String? password,
    required String? age,
    required String? diseases,
  }) async {
    _loading = true;
    update();
    http.Response response = await authRepo.register(
        name: name,
        email: email,
        phone: phone,
        password: password,
        diseases: diseases,
        age: age,);
    Map<String, dynamic> responseMap = json.decode(response.body);
    if (responseMap["status"] == 1) {
      User user = User.fromJson(responseMap["patient"]);
      showToast(responseMap["msg"]);
      storage.setUser(user);
      _loading = false;
      update();
      Get.offAll(() => LoginScreen());
    }  else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }

  void login({
    required String email,
    required String password,
  }) async {
    _loading = true;
    update();
    http.Response response = await authRepo.login(
        email: email,
        password: password,);
    Map<String, dynamic> responseMap = json.decode(response.body);
    if (responseMap["status"] == 1) {
      User user = User.fromJson(responseMap["patient"]);
      storage.setUser(user);
      showToast('Welcome ${user.name}');
      _loading = false;
      update();
      Get.offAll(() => HomeScreen());
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
