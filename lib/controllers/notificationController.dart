import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logistic/models/notification.dart';
import 'package:logistic/models/notification.dart';
import 'package:logistic/services/apiService.dart';

class NotificationController extends GetxController {
  bool _loading = false;

  bool get loading => _loading;

  List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => _notifications;

   getNotifications(BuildContext context) async {
    try {
      _loading = true;
      update();
      _notifications = await Get.find<ApiService>().getNotifications(context);
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }
}
