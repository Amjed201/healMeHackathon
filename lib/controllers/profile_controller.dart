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
import 'package:logistic/ui/screens/tabs_screen.dart';

class ProfileController extends GetxController {
  final authRepo = Get.find<AuthRepo>();
  final storage = Get.find<LocalStorage>();

  bool _loading = false;

  bool get loading => _loading;

  void updateUser({
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
      showToast('userUpdated'.tr);
      Get.back();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }
}
