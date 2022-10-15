import 'dart:convert';

import 'package:get/get.dart';
import 'package:healMe/services/helpers.dart';
import 'package:healMe/services/localStorage.dart';
import 'package:healMe/ui/screens/splash_screen.dart';
import 'package:http/http.dart' as http;

class ApiChecker {
  static void checkApi(http.Response response) {
    if (response.statusCode == 403 || response.statusCode == 403) {
      String msg = json.decode(response.body)["msg"];
      showToast(msg, isError: true);
      Get.find<LocalStorage>().clearAll();
    } else {
      String msg = json.decode(response.body)["msg"];
      showToast(msg, isError: true);
    }
  }
}
