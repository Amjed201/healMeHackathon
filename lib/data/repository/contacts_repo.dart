import 'package:get/get.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:http/http.dart' as http;

class ContactsRepo {
  final apiClient = Get.find<ApiClient>();

  Future<http.Response> getAllContacts({
    required String token,
  }) async {
    return await apiClient.get('contact', token: token);
  }

  Future<http.Response> addNewContact(
      {required String name,
      required String countryCode,
      required String primaryPhone,
       String? secondaryPhone,
      required String token}) async {
    return await apiClient.post(
        'contact',
        {
          "name": name,
          "secondaryPhone": secondaryPhone,
          "primaryPhone": primaryPhone,
          "countryCode": countryCode
        },
        token: token);
  }

  Future<http.Response> updateContact(
      {required int id,
      required String name,
      required String countryCode,
      required String primaryPhone,
       String? secondaryPhone,
      required String token}) async {
    return await apiClient.put(
        'contact/$id',
        {
          "name": name,
          "secondaryPhone": secondaryPhone,
          "primaryPhone": primaryPhone,
          "countryCode": countryCode
        },
        token: token);
  }

  Future<http.Response> deleteContact(
      {required int id, required String token}) async {
    return await apiClient.delete('contact/$id', token: token);
  }
}
