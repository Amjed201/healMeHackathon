import 'package:get/get.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:http/http.dart' as http;

class ZoneRepo {
  final apiClient = Get.find<ApiClient>();

  Future<http.Response> getAllCountries() async {
    return await apiClient.get('country');
  }

  Future<http.Response> getAllRegions() async {
    return await apiClient.get('region');
  }

  Future<http.Response> getAllCities() async {
    return await apiClient.get('city');
  }

  Future<http.Response> getAllTowns() async {
    return await apiClient.get('town');
  }

  ///Vehicles

  Future<http.Response> getVehicles() async {
    return await apiClient.get('vehicle-type');
  }
}
