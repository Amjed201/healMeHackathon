import 'package:get/get.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  final apiClient = Get.find<ApiClient>();

  Future<http.Response> sendOtp(
      {required String countryCode, required String phone}) async {
    return await apiClient.post('user-login/send-code-test', {
      "countryCode": countryCode,
      "phoneNumber": phone,
    });
  }

  Future<http.Response> confirmOtp(
      {required String countryCode,
      required String phone,
      required String otp}) async {
    return await apiClient.post('user-login/confirm-code',
        {"phoneNumber": phone, "countryCode": countryCode, "otp": otp});
  }

  Future<http.Response> register(
      {required String name, String? email, required String token}) async {
    return await apiClient.post(
        'user-login/submit-data', {"name": name, "email": email},
        token: token);
  }
}
