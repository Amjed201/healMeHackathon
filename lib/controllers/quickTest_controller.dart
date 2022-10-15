import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healMe/data/api/api_checker.dart';
import 'package:healMe/data/models/user.dart';
import 'package:healMe/data/repository/auth_repo.dart';
import 'package:healMe/data/repository/quickTest_repo.dart';
import 'package:healMe/ui/screens/result_screen.dart';
import 'package:http/http.dart' as http;
import 'package:healMe/services/helpers.dart';
import 'package:healMe/services/localStorage.dart';
import 'package:healMe/ui/screens/auth/complete_info.dart';
import 'package:healMe/ui/screens/auth/login.dart';
import 'package:healMe/ui/screens/auth/otp.dart';
import 'package:healMe/ui/screens/splash_screen.dart';

class QuickTestController extends GetxController {
  final testRepo = Get.find<QuickTestRepo>();
  final storage = Get.find<LocalStorage>();

  bool _loading = false;

  bool get loading => _loading;

  List<String> _questions = [];

  List<String> get questions => _questions;

  List<int> _answers = [];

  List<int> get answers => _answers;

  set answers(List<int> value) {
    _answers = value;
  }

  void getQuestions() async {
    _questions = [];
    _loading = true;
    update();
    http.Response response = await testRepo.getQuestions();
    if (response.statusCode == 200) {
      List myList = json.decode(response.body);
      myList.forEach((element) {
        _questions.add(element);
      });
      _loading = false;
      update();
      // _questions = response.body;
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }

  bool _isCovid = false;

  bool get isCovid => _isCovid;

  set isCovid(bool value) {
    _isCovid = value;
  }

  void sendAnswers() async {
    _loading = true;
    update();
    http.Response response = await testRepo.sendAnswers(answers);
    if (response.statusCode == 200) {
      if (response.body == '1') {
        _isCovid = true;
      } else {
        _isCovid = false;
      }
      update();
      _answers = [];
      Get.to(() => ResultScreen());
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }
}
