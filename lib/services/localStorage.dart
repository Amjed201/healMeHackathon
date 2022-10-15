import 'dart:convert';

import 'package:healMe/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences _prefs;
  bool isLoaded = false;

  Future load() async {
    if (!isLoaded) {
      _prefs = await SharedPreferences.getInstance();
      isLoaded = true;
    }
  }

  Future setLang(String lang) async {
    await _prefs.setString("lang", lang);
  }

  String? getLang() {
    if (_prefs.containsKey("lang")) return _prefs.getString("lang");

    return "";
  }

  // intro screens
  Future introSeen(bool seen) async {
    await _prefs.setBool("intro", seen);
  }

  bool? getIntroSeen() {
    return _prefs.getBool("intro");
  }

  // Token
  Future setToken(String token) async {
    await _prefs.setString("token", token);
  }

  String? getToken() {
    return _prefs.getString("token");
  }

  // Support Token
  Future setSupportToken(String token) async {
    await _prefs.setString("supportToken", token);
  }

  String? getSupportToken() {
    return _prefs.getString("supportToken");
  }

  //FCM Token
  Future setFcmToken(String token) async {
    await _prefs.setString("fcmToken", token);
  }

  String? getFcmToken() {
    return _prefs.getString("fcmToken");
  }


  // User
  Future setUser(User? user) async {
    if (user != null) {
      String json = jsonEncode(user.toJson());
      await _prefs.setString("userData", json);
    } else {
      return "";
    }
  }

  User? getUser() {
    String? json = _prefs.getString("userData");
    if (json != null && json.isNotEmpty) {
      var obj = jsonDecode(json);
      return User.fromJson(obj);
    } else {
      return null;
    }
  }

  // Clear All
  Future clearAll() async {
    await _prefs.clear();
  }
}
