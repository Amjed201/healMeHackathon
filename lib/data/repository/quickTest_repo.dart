import 'package:get/get.dart';
import 'package:healMe/data/api/apiService.dart';
import 'package:http/http.dart' as http;

class QuickTestRepo {
  final apiClient = Get.find<ApiClient>();

  Future<http.Response> getQuestions() async {
    return await apiClient.get(
      '',
    );
  }

  Future<http.Response> sendAnswers(List answers) async {
    return await apiClient.post('', {
      "symptoms": [
        ...answers,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        ///14
        1,
        0,
        0,
        0,
        0,
        0,
        0,
      ]
      //   answers
      //   [
      //   1,
      //   1,
      //   1,
      //   1,
      //   1,
      //   0,
      //   0,
      //   0,
      //   0,
      //   0,
      //   0,
      //   0,
      //   0,
      //   1,
      //   0,
      //   0,
      //   0,
      //   0,
      //   0,
      //   0,
      // ]
    });
  }
}
