import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logistic/services/apiService.dart';

class PaymentController extends GetxController {
  final api = Get.find<ApiService>();

  bool _loading = false;

  bool get loading => _loading;

  File? get image => _image;
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    update();
  }

  Future sendScreenshot(BuildContext context, int orderId) async {
    try {
      _loading = true;
      update();
      await api.sendMbok(context, orderId, _image);
      _loading = false;
      _image = null;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      _image = null;
      update();
    }
  }
}
