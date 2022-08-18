import 'package:get/get.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:http/http.dart' as http;

class OrderStatusRepo {
  final apiClient = Get.find<ApiClient>();

  //('Created','PendingStart','Started','GoingToPickup','PendingLoadIn',
// 'PendingPaymentOnPickup','Loaded','GoingToDropOff','PendingPaymentOnDropOff',
// 'PendingLoadOff','Completed','Canceled')

  Future<http.Response> changeOrderStatus(
      {required int orderId,
      required String status,
      required String token}) async {
    return await apiClient.get(
        status == 'PendingLoadIn'
            ? 'order-process/confirm-load-in/$orderId'
            : 'order-process/confirm-load-off/$orderId',
        token: token);
  }

  Future<http.Response> cancelOrder(
      {required int orderId,
      required String reason,
      required String token}) async {
    return await apiClient
        .post('order/user-cancel/$orderId', {"reason": reason}, token: token);
  }
}
