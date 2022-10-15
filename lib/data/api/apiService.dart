import 'dart:convert';
import 'package:get/get.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:healMe/services/localStorage.dart';
import 'package:dio/dio.dart' as dio;

class ApiClient {
  // static const String baseUrl = "http://192.168.43.170:8081/";
  static const String baseUrl = "http://140.238.71.119:3000/";
  static const String baseUrl2 = "http://192.168.43.170:8081/";
  static const String imageBaseUrl = "http://192.168.43.170:8081/";

  Future<http.Response> get(String url, {String token = ""}) async {
    final response = await http.get(Uri.parse(baseUrl + url), headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": token == "" ? "" : token
    });
    return response;
  }

  Future<http.Response> get2(String url, {String token = ""}) async {
    final response = await http.get(Uri.parse(baseUrl2 + url), headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": token == "" ? "" : token
    });
    return response;
  }

  Future<http.Response> post(String url, dynamic bodyMap,
      {String token = ""}) async {
    final response = await http.post(Uri.parse(baseUrl + url),
        body: jsonEncode(bodyMap),
        headers: {
          "Content-type": "application/json",
          "Authorization": token == "" ? "" : token
        });
    return response;
  }

  Future<http.Response> post2(String url, dynamic bodyMap,
      {String token = ""}) async {
    final response = await http.post(Uri.parse(baseUrl2 + url),
        body: jsonEncode(bodyMap),
        headers: {
          "Content-type": "application/json",
          "Authorization": token == "" ? "" : token
        });
    return response;
  }

  Future<http.Response> patch(String url, dynamic bodyMap,
      {String token = ""}) {
    return http.patch(Uri.parse(baseUrl + url),
        body: jsonEncode(bodyMap),
        headers: {
          "Content-type": "application/json",
          "Authorization": token == "" ? "" : token
        });
  }

  Future<http.Response> put(String url, dynamic bodyMap, {String? token = ""}) {
    return http.put(Uri.parse(baseUrl + url),
        body: jsonEncode(bodyMap),
        headers: {
          "Content-type": "application/json",
          "Authorization": token == "" ? "" : "$token"
        });
  }

  Future<http.Response> delete(String url,
      {dynamic bodyMap, String? token = ""}) {
    return http.delete(Uri.parse(baseUrl + url),
        headers: {
          "Content-type": "application/json",
          "Authorization": token == "" ? "" : "$token"
        });
  }
}
