import 'dart:convert';
import 'package:get/get.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:logistic/services/localStorage.dart';
import 'package:dio/dio.dart' as dio;

class ApiClient {
  static const String _baseUrl = "https://logistics.elkhalifa.dev/api/";

  Future<http.Response> get(String url, {String token = ""}) async {
    final response = await http.get(Uri.parse(_baseUrl + url), headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": token == "" ? "" : token
    });
    return response;
  }

  Future<http.Response> post(String url, dynamic bodyMap,
      {String token = ""}) async {
    final response = await http.post(Uri.parse(_baseUrl + url),
        body: jsonEncode(bodyMap),
        headers: {
          "Content-type": "application/json",
          "Authorization": token == "" ? "" : token
        });
    return response;
  }

  Future<http.Response> patch(String url, dynamic bodyMap,
      {String token = ""}) {
    return http.patch(Uri.parse(_baseUrl + url),
        body: jsonEncode(bodyMap),
        headers: {
          "Content-type": "application/json",
          "Authorization": token == "" ? "" : token
        });
  }

  Future<http.Response> put(String url, dynamic bodyMap, {String? token = ""}) {
    return http.put(Uri.parse(_baseUrl + url),
        body: jsonEncode(bodyMap),
        headers: {
          "Content-type": "application/json",
          "Authorization": token == "" ? "" : "$token"
        });
  }

  Future<http.Response> delete(String url,
      {dynamic bodyMap, String? token = ""}) {
    return http.delete(Uri.parse(_baseUrl + url),
        headers: {
          "Content-type": "application/json",
          "Authorization": token == "" ? "" : "$token"
        });
  }
}
