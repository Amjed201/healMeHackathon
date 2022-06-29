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
  var endDateController = TextEditingController();
  var detailsController = TextEditingController();
  var reciverController = TextEditingController();
  var reciverPhoneController = TextEditingController();
}
