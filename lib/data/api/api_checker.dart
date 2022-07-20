import 'package:get/get.dart';
import 'package:logistic/services/helpers.dart';
import 'package:logistic/services/localStorage.dart';
import 'package:logistic/ui/screens/splash.dart';
import 'package:http/http.dart' as http;

class ApiChecker {
  static void checkApi(http.Response response) {
    if (response.statusCode == 401) {
      Get.find<LocalStorage>().clearAll();
      showToast(response.body , isError: true);
      // Get.offAll(() => const SplashScreen());
    } else {
      showToast('${response.body}' , isError: true);
    }
  }
}
