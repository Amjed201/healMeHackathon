import 'package:get/get.dart';
import 'package:healMe/data/api/apiService.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  final apiClient = Get.find<ApiClient>();


  Future<http.Response> login(
      {
      required String email,
      required String password}) async {
    return await apiClient.post2('login',
        {"email": email, "password": password, });
  }

  Future<http.Response> register(
      {required String name,
      required String? phone,
      required String? password,
      required String? age,
      required String? diseases,
      required String? email,
     }) async {
    return await apiClient.post2(
        'signup',
        {
          "name": name,
          "email": email,
          "phone": phone,
          "password": password,
          "age": age,
          "diseases": [diseases],
        },
    );
  }

}
