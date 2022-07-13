import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CreateOrderController extends GetxController {
  List<DropdownMenuItem<String>> paymentMethods = [
    const DropdownMenuItem(child: Text("Cash"), value: "Cash"),
    const DropdownMenuItem(child: Text("Visa"), value: "Visa"),
  ];
  List<DropdownMenuItem<String>> cities = [
    const DropdownMenuItem(child: Text("Khartoum"), value: "KH"),
    const DropdownMenuItem(child: Text("Medani"), value: "MD"),
  ];

  var startDateController = TextEditingController();
  var detailsController = TextEditingController();
  var reciverController = TextEditingController();
  var reciverPhoneController = TextEditingController();
  var reciverPhoneController2 = TextEditingController();

  DateTime? startDate;

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970, 8),
        lastDate: DateTime(2023));
    if (picked != null && picked != startDate) {
      startDate = picked;
      update();
    }
  }

  bool _anotherReceiver = false;

  bool get anotherReceiver => _anotherReceiver;


  void toggleReceiver() {
    _anotherReceiver = !_anotherReceiver;
    update();
  }
}
