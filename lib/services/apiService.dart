import 'dart:convert';
import 'package:get/get.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:logistic/services/localStorage.dart';
import 'package:dio/dio.dart' as dio;
class ApiService {
  static String _baseUrl = "https://kafiapp.com/api/";
  static String _testUrl = "https://kafiapp.com/api/v2/";

  Future<http.Response> _get(String url, {String token = ""}) async {
    final response = await http.get(Uri.parse(_baseUrl + url), headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": token == "" ? "" : "Bearer $token"
    });
    // if (response.statusCode == 401) Get.find<AuthController>().clearUser(false);
    return response;
  }

  Future<http.Response> _getTest(String url, {String token = ""}) async {
    final response = await http.get(Uri.parse(_testUrl + url), headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": token == "" ? "" : "Bearer $token"
    });
    // if (response.statusCode == 401) Get.find<AuthController>().clearUser(false);
    return response;
  }

  Future<http.Response> _post(String url, dynamic bodyMap,
      {String token = ""}) async {
    final response = await http
        .post(Uri.parse(_baseUrl + url), body: jsonEncode(bodyMap), headers: {
      "Content-type": "application/json",
      "Authorization": token == "" ? "" : "Bearer $token"
    });
    // if (response.statusCode == 401) Get.find<AuthController>().clearUser(false);
    return response;
  }

  Future<http.Response> _patch(String url, dynamic bodyMap,
      {String token = ""}) {
    return http
        .patch(Uri.parse(_baseUrl + url), body: jsonEncode(bodyMap), headers: {
      "Content-type": "application/json",
      "Authorization": token == "" ? "" : "Bearer $token"
    });
  }

  Future<http.Response> _put(String url, dynamic bodyMap,
      {String? token = ""}) {
    return http
        .put(Uri.parse(_baseUrl + url), body: jsonEncode(bodyMap), headers: {
      "Content-type": "application/json",
      "Authorization": token == "" ? "" : "Bearer $token"
    });
  }

  Future<http.Response> _delete(String url, dynamic bodyMap,
      {String? token = ""}) {
    return http
        .delete(Uri.parse(_baseUrl + url), body: jsonEncode(bodyMap), headers: {
      "Content-type": "application/json",
      "Authorization": token == "" ? "" : "Bearer $token"
    });
  }

  final storage = Get.find<LocalStorage>();

}

class ApiException implements Exception {
  int statusCode;
  String message;

  ApiException(this.statusCode, this.message);

  @override
  String toString() {
    return this.message;
  }
}
