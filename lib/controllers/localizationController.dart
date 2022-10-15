import 'dart:convert';
import 'package:healMe/services/localStorage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healMe/ui/screens/splash_screen.dart';

class LocalizationController extends GetxController {
  Locale _locale = const Locale('ar', 'AR');
  bool _isLtr = true;

  Locale get locale => _locale;

  bool get isLtr => _isLtr;

  void changeLanguage() async {
    await Get.offAll(() =>  SplashScreen());
    if (_locale.languageCode == 'ar') {
      Get.updateLocale(const Locale('en', 'EN'));
      _locale = const Locale('en', 'EN');
    } else {
      Get.updateLocale(const Locale('ar', 'Ar'));
      _locale = const Locale('ar', 'Ar');
    }
    if (_locale.languageCode == 'ar') {
      _isLtr = false;
    } else {
      _isLtr = true;
    }
    saveLanguage(_locale);
    update();
  }

  Future<String?> loadCurrentLanguage() async {
    String? langCode = Get.find<LocalStorage>().getLang();
    langCode == 'ar'
        ? _locale = const Locale('ar', 'Ar')
        : _locale = const Locale('en', 'En');
    update();
    return langCode;
  }

  void saveLanguage(Locale locale) async {
    Get.find<LocalStorage>().setLang(locale.languageCode);
  }
}
