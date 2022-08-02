import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistic/data/api/apiService.dart';
import 'package:logistic/data/api/api_checker.dart';
import 'package:logistic/data/models/contact.dart';
import 'package:logistic/data/models/user.dart';
import 'package:logistic/data/repository/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:logistic/data/repository/contacts_repo.dart';
import 'package:logistic/services/helpers.dart';
import 'package:logistic/services/localStorage.dart';
import 'package:logistic/ui/screens/auth/complete_info.dart';
import 'package:logistic/ui/screens/auth/login.dart';
import 'package:logistic/ui/screens/auth/otp.dart';
import 'package:logistic/ui/screens/tabs_screen.dart';

class ContactsController extends GetxController {
  final contactsRepo = Get.find<ContactsRepo>();
  final storage = Get.find<LocalStorage>();

  bool _loading = false;

  bool get loading => _loading;

  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  set contacts(List<Contact> value) {
    _contacts = value;
    update();
  }

  List<DropdownMenuItem<Contact>> contactsMenu = [];

  Contact? selectedContact;

  void getContacts() async {
    contactsMenu = [];
    _loading = true;
    update();
    http.Response response =
        await contactsRepo.getAllContacts(token: storage.getToken()!);
    if (response.statusCode == 200) {
      List dataList = json.decode(response.body);
      _contacts = dataList.map((e) => Contact.fromJson(e)).toList();
      _loading = false;
      update();
      for (var element in _contacts) {
        contactsMenu.add(
            DropdownMenuItem(child: Text(element.name ?? ''), value: element));
      }
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }

  Future<void> addNewContact(
      {required String name,
      required String countryCode,
      required String primaryPhone,
      required String? secondaryPhone,
      required bool addFromOrder,

      }) async {
    _loading = true;
    update();
    http.Response response = await contactsRepo.addNewContact(
        name: name,
        countryCode: countryCode,
        primaryPhone: primaryPhone,
        secondaryPhone: secondaryPhone,
        token: storage.getToken()!);
    if (response.statusCode == 200) {
      _loading = false;
      update();
      showToast('addedSuccess'.tr);
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
    if(!addFromOrder) {
      getContacts();
      Get.back();
    }
  }

  void updateContact(
      {required int id,
      required String name,
      required String countryCode,
      required String primaryPhone,
      String? secondaryPhone}) async {
    _loading = true;
    update();
    http.Response response = await contactsRepo.updateContact(
        id: id,
        name: name,
        countryCode: countryCode,
        primaryPhone: primaryPhone,
        secondaryPhone: secondaryPhone,
        token: storage.getToken()!);
    if (response.statusCode == 200) {
      _loading = false;
      update();
      showToast('addedSuccess'.tr);
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
    getContacts();
    Get.back();
  }

  void confirmToDelete(int id) {
    Get.defaultDialog(
      title: 'sureDelete'.tr,
      content: const SizedBox(),
      cancel: InkWell(
        onTap: () => Get.back(),
        child: Text(
          'no'.tr,
        ),
      ),
      confirm: InkWell(
          onTap: () {
            Get.back();
            _deleteContact(id: id);
          },
          child: Text('yes'.tr, style: const TextStyle(color: Colors.red))),
    );
  }

  void _deleteContact({
    required int id,
  }) async {
    _loading = true;
    update();
    http.Response response =
        await contactsRepo.deleteContact(id: id, token: storage.getToken()!);
    if (response.statusCode == 200) {
      _loading = false;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
    getContacts();
  }
}
