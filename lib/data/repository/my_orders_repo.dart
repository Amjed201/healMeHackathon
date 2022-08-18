import 'package:get/get.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:http/http.dart' as http;

class MyOrdersRepo {
  final apiClient = Get.find<ApiClient>();

  //('Created','PendingStart','Started','GoingToPickup','PendingLoadIn',
  // 'PendingPaymentOnPickup','Loaded','GoingToDropOff','PendingPaymentOnDropOff',
  // 'PendingLoadOff','Completed','Canceled')
  Future<http.Response> getRunningOrders({required String token}) async {
    return await apiClient.post('order/user-search',{},
        token: token);
  }

  Future<http.Response> getPreviousOrders({required String token}) async {
    return await apiClient.post('order/user-search', {'status': 'Completed'},
        token: token);
  }
}
