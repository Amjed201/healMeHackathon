import 'package:get/get.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:http/http.dart' as http;

class BidRepo {
  final apiClient = Get.find<ApiClient>();

  Future<http.Response> getBidsForOrder(
      {required String token, required int orderId}) async {
    return await apiClient.get('order/my-bid/$orderId', token: token);
  }

}
