import 'package:get/get.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:http/http.dart' as http;

class BidRepo {
  final apiClient = Get.find<ApiClient>();

  Future<http.Response> getBidsForOrder(
      {required String token, required int orderId}) async {
    return await apiClient.get('order/$orderId/bids/', token: token);
  }

  Future<http.Response> acceptBidForOrder({
    required String token,
    required int orderId,
    required int bidId,
  }) async {
    return await apiClient.put('order/$orderId/bid/', {"bidId": bidId},
        token: token);
  }
}
