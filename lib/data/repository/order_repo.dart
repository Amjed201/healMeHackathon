import 'package:get/get.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:http/http.dart' as http;

class OrderRepo {
  final apiClient = Get.find<ApiClient>();

  Future<http.Response> createOrder(
      {required String countryCode,
      required String phone,
      required String otp}) async {
    return await apiClient.post('order/create-order', {
      "paymentType": "cash",
      "pickupCity": "Khartoum",
      "pickupTown": "Khartoum",
      "dropOffCity": "Khartoum",
      "dropOffTown": "Khartoum",
      "pickupTime": "2020-01-01T00:00:00.000Z",
      "dropOffContactName": 2,
      "details": "details",
      "locationLng": "locationLng",
      "locationLat": "locationLat",
      "vehicleType": 1
    });
  }
}
