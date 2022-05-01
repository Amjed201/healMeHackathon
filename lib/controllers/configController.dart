import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logistic/services/apiService.dart';

class ConfigController extends GetxController {
  int _pageIndex = 0;

  set pageIndex(int value) {
    _pageIndex = value;
  }

  int get pageIndex => _pageIndex;

  bool _loading = false;

  bool get loading => _loading;

  String? _shareUrl = '';

  String? get shareUrl => _shareUrl;

  String? _shareText = '';

  String? get shareText => _shareText;

  String? _about = '';

  String? get about => _about;

  String? _privacy = '';

  String? get privacy => _privacy;
  String? _howToBuy = '';

  String? get howToBuy => _howToBuy;

  String _accountName = 'name';

  String get accountName => _accountName;

  String _accountNo = '#00000';

  String get accountNo => _accountNo;

  Future<bool> getConfig(BuildContext context) async {
    var config;
    try {
      _loading = true;
      update();
      config = await Get.find<ApiService>().getConfig(context);
      _about = config['about_us'];
      _shareUrl = config['share_url'];
      _shareText = config['share_text'];
      _privacy = config['privacy_policy'];
      _howToBuy = config['how_to_buy'];
      _accountName = config['mbok_name'];
      _accountNo = config['mbok_number'].toString();
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
    return config == null ? false : true;
  }
}
