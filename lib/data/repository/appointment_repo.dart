import 'package:get/get.dart';
import 'package:healMe/data/api/apiService.dart';
import 'package:http/http.dart' as http;

class AppointmentRepo {
  final apiClient = Get.find<ApiClient>();

  Future<http.Response> getCategories() async {
    return await apiClient.get2(
      'categories',
    );
  }

  Future<http.Response> getTimeSlots() async {
    return await apiClient.get2(
      'timeslots',
    );
  }

  Future<http.Response> getAppointments(String id) async {
    return await apiClient.get2(
      'appointments/$id',
    );
  }

  Future<http.Response> getDoctors(String categoryId) async {
    return await apiClient.get2(
      'doctors/$categoryId',
    );
  }

  Future<http.Response> addAppointment({
    required String id,
    required String doctorId,
    required String categoryId,
    required String categoryName,
    required int slotId,
    required String slotName,
  }) async {
    return await apiClient.post2('appointments', {
      "patientId": id,
      "doctorId": doctorId,
      "category": {"id": categoryId, "name": categoryName},
      "timeslot": {"num": slotId, "str": slotName}
    });
  }
}
