import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:logistic/controllers/authController.dart';
import 'package:logistic/controllers/configController.dart';
import 'package:logistic/models/notification.dart';
import 'package:logistic/services/helpers.dart';
import 'package:logistic/services/helpers.dart';
import 'package:logistic/models/category.dart';
import 'package:logistic/models/merchant.dart' as merchant;
import 'package:logistic/models/offer.dart';
import 'package:logistic/models/order.dart';
import 'package:logistic/models/requests/addOrder.dart';
import 'package:logistic/models/requests/updateUser.dart';
import 'package:logistic/models/user.dart';
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

  Future getConfig(BuildContext context) async {
    var response = await _get(
        Get.locale!.languageCode == 'ar' ? "config?lang=ar" : "config?lang=en",
        token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      var config = responseMap["data"];
      return config;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<User> getProfile(BuildContext context) async {
    print(storage.getToken() ?? '');
    var response = await _get("my_profile", token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      User user = User.fromJson(responseMap["data"]);
      return user;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<bool> sendOtp(String phone, BuildContext context) async {
    var response = await _post(
      "send_otp",
      {"phone_number": phone},
    );
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      showToast(responseMap["ResponseMessage"], context);
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
    return responseMap["ResponseCode"] == 1;
  }

  Future<List<bool>> checkOtp(
      String phone, String code, BuildContext context) async {
    var response = await _post(
      "check_otp",
      {
        "phone_number": phone,
        "code": code,
        "firebase_id": storage.getFcmToken() ?? 'not-found'
      },
    );
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      showToast(responseMap["ResponseMessage"], context);
      storage.setToken(responseMap["data"]["token"]);
      User user = User.fromJson(responseMap["data"]["user"]);
      // storage.setUser(user);
      Get.find<AuthController>().user = user;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
    //return request status , and isVerified ( if its the first time for user to login)
    bool requestStatus = responseMap["ResponseCode"] == 1;
    bool isVerified = responseMap["data"]["user"]["is_verified"] == 1;
    return [requestStatus, isVerified];
  }

  Future<bool> addPassword(String password, BuildContext context) async {
    final auth = Get.find<AuthController>();
    print(storage.getToken());
    var response =
        await _put("update_user", {"password": password}, token: storage.getToken());
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      showToast(responseMap["ResponseMessage"], context);
      User user = User.fromJson(responseMap["data"]);
      // storage.setUser(user);
      auth.user = user;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
    return responseMap["ResponseCode"] == 1;
  }

  Future<bool> updateUser(UpdateUser user, BuildContext context) async {
    final auth = Get.find<AuthController>();
    print(storage.getToken() ?? '');
    var body;
    try {
      dio.FormData formData = dio.FormData.fromMap({
        "full_name": user.fullName,
        // "phone_number": user.phoneNumber,
        "email": user.email,
        "dob": user.dob,
        "gender_id": user.genderId,
        "city_id": user.cityId,
        "neighborhood_id": user.neighborhoodId,
        'image': user.image == null
            ? null
            : await dio.MultipartFile.fromFile(user.image!.path,
                filename: user.image?.path.split('/').last),
      });
      dio.Response response = await dio.Dio().post(_baseUrl + "update_user",
          data: formData
          // {
          //   "full_name": user.fullName,
          //   "phone_number": user.phoneNumber,
          //   "email": user.email,
          //   "dob": user.dob,
          //   "gender_id": user.genderId,
          //   "city_id": user.cityId,
          //   "neighborhood_id": user.neighborhoodId,
          //   'image': await dio.MultipartFile.fromFile(user.image!.path,
          //           filename: user.image?.path.split('/').last),
          // }
          ,
          options: dio.Options(responseType: dio.ResponseType.plain, headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "Authorization": "Bearer ${storage.getToken() ?? ''}"
          }));

      body = json.decode(response.data);

      if (body["ResponseCode"] == 1) {
        print('success');
        showToast(body["ResponseMessage"], context);
        User user = User.fromJson(body["data"]);
        // storage.setUser(user);
        auth.user = user;
      } else {
        print('failed');
        showToast(body["ResponseMessage"], context);
        throw ApiException(response.statusCode!, body["ResponseMessage"]);
      }
      return true;
    } catch (e) {
      if (e is dio.DioError) {
        print('failed');
        // showToast(body["ResponseMessage"], context);
        // throw ApiException(response.statusCode!, body["ResponseMessage"]);
      }
      return false;
    }

    // var response = await _put("update_user", user, token: storage.getToken());
    // var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    // if (responseMap["ResponseCode"] == 1) {
    //   print('success');
    //   showToast(responseMap["ResponseMessage"], context);
    //   User user = User.fromJson(responseMap["data"]);
    //   storage.setUser(user);
    //   auth.user = user;
    // } else {
    //   print('failed');
    //   showToast(responseMap["ResponseMessage"], context);
    //   throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    // }
    // return responseMap["ResponseCode"] == 1;
  }

  Future<bool> addOrder(BuildContext context, AddOrder order) async {
    var response =
        await _post("add_order", order, token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      showToast('Order added successfully', context);
      print('success');
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
    return (responseMap["ResponseCode"] == 1);
  }

  Future<int> applyPromo(BuildContext context, String promo) async {
    var response = await _post("apply_promo_code", {"promo_code": promo},
        token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      showToast(responseMap["ResponseMessage"], context);
      print('success');
      int discountAmount = responseMap["data"]["discount_amount"];
      return discountAmount;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context,
          color: Colors.red[900]);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<Category>> getCategories(BuildContext context) async {
    print(storage.getToken());
    var response = await _get(
      "offer_categories",
    );
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"] as List;
      List<Category> categories =
          dataList.map((e) => Category.fromJson(e)).toList();
      return categories;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<SubCategory>> getSubCategory(BuildContext context, int id) async {
    var response = await _get("sub_categories?offer_category_id=$id",
        token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"] as List;
      List<SubCategory> categories =
          dataList.map((e) => SubCategory.fromJson(e)).toList();
      return categories;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<merchant.Merchant>> getMerchants(BuildContext context,
      {int? categoryId}) async {
    var response = await _get(
      categoryId == null
          ? "merchants"
          : "merchants?offer_category_id=$categoryId",
    );
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"] as List;
      List<merchant.Merchant> merchants =
          dataList.map((e) => merchant.Merchant.fromJson(e)).toList();
      return merchants;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<Order>> myOrders(BuildContext context, int page) async {
    print(storage.getToken() ?? '');
    var response = await _getTest("my_orders", token: storage.getToken()! ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"] as List;
      List<Order> orders = dataList.map((e) => Order.fromJson(e)).toList();
      return orders;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<Order>> myOrderHistory(BuildContext context, int page) async {
    print(storage.getToken() ?? '');
    var response =
        await _getTest("my_order_history", token: storage.getToken()! ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"] as List;
      List<Order> orders = dataList.map((e) => Order.fromJson(e)).toList();
      return orders;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<Ads>> getBanners(BuildContext context) async {
    final id = Get.find<AuthController>().user?.id ?? 0;
    var response =
        await _get("ads?user_id=$id", token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"] as List;
      List<Ads> offers = dataList.map((e) => Ads.fromJson(e)).toList();
      return offers;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<Deals>> getOffers(BuildContext context,
      {int? categoryId, int? subId, int? page}) async {
    final id = Get.find<AuthController>().user?.id ?? 0;
    var response = await _get(
        categoryId == null
            ? "offers?user_id=$id&page=$page"
            : subId == null
                ? "offers?user_id=$id&offer_category_id=$categoryId&page=$page"
                : "offers?user_id=$id&offer_category_id=$categoryId&offer_sub_category_id=$subId&page=$page",
        token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"]["data"] as List;
      List<Deals> offers = dataList.map((e) => Deals.fromJson(e)).toList();
      return offers;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<Deals>> searchOffers(BuildContext context, String key) async {
    final id = Get.find<AuthController>().user?.id ?? 0;

    var response = await _get("search_offers?user_id=$id&key=$key",
        token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"]["data"] as List;
      List<Deals> offers = dataList.map((e) => Deals.fromJson(e)).toList();
      if (offers.isEmpty) showToast('noSearch'.tr, context);

      return offers;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<Deals>> nearbyOffers(
      BuildContext context, String lat, String lng) async {
    final id = Get.find<AuthController>().user?.id ?? 0;

    var response = await _get("nearby_offers?user_id=$id&location=$lat,$lng",
        token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"]["data"] as List;
      List<Deals> offers = dataList.map((e) => Deals.fromJson(e)).toList();
      return offers;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<Deals>> getHotDeals(BuildContext context) async {
    final id = Get.find<AuthController>().user?.id ?? 0;
    var response =
        await _get("hot_deals?user_id=$id", token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"]["data"] as List;
      List<Deals> offers = dataList.map((e) => Deals.fromJson(e)).toList();
      return offers;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<Deals>> getRecentDeals(BuildContext context) async {
    final id = Get.find<AuthController>().user?.id ?? 0;

    var response =
        await _get("recents?user_id=$id", token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"]["data"] as List;
      List<Deals> offers = dataList.map((e) => Deals.fromJson(e)).toList();
      return offers;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<Deals>> getBestSellers(BuildContext context) async {
    final id = Get.find<AuthController>().user?.id ?? 0;
    var response =
        await _get("best_seller?user_id=$id", token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"]["data"] as List;
      List<Deals> offers = dataList.map((e) => Deals.fromJson(e)).toList();
      return offers;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<Deals>> getFavorites(BuildContext context) async {
    final id = Get.find<AuthController>().user?.id ?? 0;

    var response =
        await _get("my_favorites?user_id=$id", token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"] as List;
      List<Deals> offers =
          dataList.map((e) => Deals.fromJson(e["offer"])).toList();
      return offers;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<bool> addFav(BuildContext context, int id) async {
    var response = await _post("add_favorite", {"offer_id": id},
        token: storage.getToken() ?? '');
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      // showToast(responseMap["ResponseMessage"], context);
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
    return (responseMap["ResponseCode"] == 1);
  }

  Future<List<City>> getCities(BuildContext context) async {
    print(storage.getToken());
    var response = await _get("cities", token: storage.getToken()!);
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"] as List;
      List<City> cities = dataList.map((e) => City.fromJson(e)).toList();
      return cities;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<City>> getNeighborhoods(BuildContext context) async {
    print(storage.getToken());
    var response = await _get("neighborhoods", token: storage.getToken()!);
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"] as List;
      List<City> neighborhoods = dataList.map((e) => City.fromJson(e)).toList();
      return neighborhoods;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<List<NotificationModel>> getNotifications(BuildContext context) async {
    print(storage.getToken());
    var response = await _get("my_notifications", token: storage.getToken()!);
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      List dataList = responseMap["data"] as List;
      List<NotificationModel> cities =
          dataList.map((e) => NotificationModel.fromJson(e)).toList();
      return cities;
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future sendMbok(BuildContext context, int id, File? image) async {
    dio.FormData formData = dio.FormData.fromMap({
      "order_id": id,
      'image': await dio.MultipartFile.fromFile(image!.path,
          filename: image.path.split('/').last),
    });
    try {
      dio.Response response = await dio.Dio().post(_baseUrl + "add_payment",
          data: formData,
          options: dio.Options(responseType: dio.ResponseType.plain, headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "Authorization": "Bearer ${storage.getToken() ?? ''}"
          }));

      Fluttertoast.showToast(
          msg: 'sentSuccess'.tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.green,
          fontSize: 16.0);

      Get.back();

      print(response);
    } catch (e) {
      if (e is dio.DioError) {
        Fluttertoast.showToast(
            msg: e.error,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.red,
            fontSize: 16.0);
        print(e.toString());
      }
    }
  }

  Future updateFirebaseID(BuildContext context) async {
    print(storage.getToken());
    var response = await _put(
      "update_firebase_id",
      {"firebase_id": storage.getFcmToken()},
      token: storage.getToken()!,
    );
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
    } else {
      print('failed');
      showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
  }

  Future<String> rateOrder(
    BuildContext context,
    int orderId,
    double value,
    String comment,
  ) async {
    var response = await _post(
      "add_offer_rate",
      {"comment": comment==''?'-' : comment, "rate_value": value, "order_id": orderId},
      token: storage.getToken()!,
    );
    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    if (responseMap["ResponseCode"] == 1) {
      print('success');
      // showToast(responseMap["ResponseMessage"], context);
    } else {
      print('failed');
      // showToast(responseMap["ResponseMessage"], context);
      throw ApiException(response.statusCode, responseMap["ResponseMessage"]);
    }
    return responseMap["ResponseMessage"];
  }
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
