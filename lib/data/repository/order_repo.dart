import 'package:get/get.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:http/http.dart' as http;

class OrderRepo {
  final apiClient = Get.find<ApiClient>();

  Future<http.Response> calculatePrice(
      {required int vehicleId, required String distance}) async {
    return await apiClient.get('price-range/calculate/$vehicleId/$distance');
  }

  Future<http.Response> createOrder(
      {  String? paymentType,
       int? pickupCityId,
       int?  pickupRegionId,
       int? dropOffCityId,
       int? dropOffRegionId,
       String? pickupTime = "2020-01-01T00:00:00.000Z",
       int? contactId,
       String? details,
       String? pickupLat,
       String? pickupLng,
       String? dropOffLat,
       String? dropOffLng,
       int? vehicleType,
       required String token,


      }) async {
    return await apiClient.post('order/create-order', {
      "paymentType": paymentType,
      "pickupCity": pickupCityId,
      "pickupRegion": pickupRegionId,
      "dropOffCity": dropOffCityId,
      "dropOffRegion": dropOffRegionId,
      "pickupTime": "2020-01-01T00:00:00.000Z",
      "dropOffContact": contactId,
      "details": details,
      "pickupLocationLng": pickupLng,
      "pickupLocationLat": pickupLat,
      "dropOffLocationLng": dropOffLng,
      "dropOffLocationLat": dropOffLat,
      "vehicleType": 1
    },token: token);
  }
  //  "paymentType": "CashOnPickup",
//   "pickupRegion": 1,
//   "pickupCity": 1,
//   "dropOffRegion": 1,
//   "dropOffCity": 1,
//   "pickupTime": "2020-01-01T00:00:00.000Z",
//   "dropOffContact": 1,
//   "details": "details",
//   "pickupLocationLng": "locationLng",
//   "pickupLocationLat": "locationLat",
//   "dropOffLocationLng": "locationLng",
//   "dropOffLocationLat": "locationLat",
//   "vehicleType": 1
}
