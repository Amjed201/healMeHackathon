import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateOrderController extends GetxController {
  List<DropdownMenuItem<String>> paymentMethods = [
    const DropdownMenuItem(child: Text("Cash"), value: "Cash"),
    const DropdownMenuItem(child: Text("Visa"), value: "Visa"),
  ];

  List<DropdownMenuItem<String>> regions = [
    const DropdownMenuItem(child: Text("Sudan"), value: "Sdn"),
    const DropdownMenuItem(child: Text("KSA"), value: "Ksa"),
  ];
  List<DropdownMenuItem<String>> cities = [
    const DropdownMenuItem(child: Text("Khartoum"), value: "KH"),
    const DropdownMenuItem(child: Text("Medani"), value: "MD"),
  ];

  List<DropdownMenuItem<String>> vehicles = [
    DropdownMenuItem(
        child: Row(
          children: [
            SizedBox(
              height: 52,
              width: 76,
              child: Image.asset('assets/images/car_placeholder.png'),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  'Van'.tr,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Van'.tr,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        value: "Van"),
    DropdownMenuItem(
        child: Row(
          children: [
            SizedBox(
              height: 52,
              width: 76,
              child: Image.asset('assets/images/car_placeholder.png'),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  'Lorry'.tr,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Lorry'.tr,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        value: "Lorry")
  ];

  String? _selectedVehicle = '';

  String? get selectedVehicle => _selectedVehicle;

  set selectedVehicle(String? value) {
    _selectedVehicle = value;
    update();
  }

  String? _selectedRegion1 = '';

  String? get selectedRegion1 => _selectedRegion1;

  set selectedRegion1(String? value) {
    _selectedRegion1 = value;
    update();
  }

  String? _selectedRegion2 = '';

  String? get selectedRegion2 => _selectedRegion2;

  set selectedRegion2(String? value) {
    _selectedRegion2 = value;
    _autoPickRegion = false;
    update();
  }

  bool _autoPickRegion = true;

  bool get autoPickRegion => _autoPickRegion;

  String? _selectedCity1 = '';

  String? get selectedCity1 => _selectedCity1;

  set selectedCity1(String? value) {
    _selectedCity1 = value;
    update();
  }

  String? _selectedCity2 = '';

  String? get selectedCity2 => _selectedCity2;

  set selectedCity2(String? value) {
    _selectedCity2 = value;
    _autoPickCity = false;
    update();
  }

  bool _autoPickCity = true;

  bool get autoPickCity => _autoPickCity;

  var startDateController = TextEditingController();
  var detailsController = TextEditingController();
  var reciverController = TextEditingController();
  var reciverPhoneController = TextEditingController();
  var reciverPhoneController2 = TextEditingController();

  DateTime? _startDate;
  TimeOfDay? _startTime;

  DateTime? get startDate => _startDate;

  TimeOfDay? get startTime => _startTime;

  Future<void> pickDateAndTime(BuildContext context) async {
    _startDate = null;
    _startTime = null;
    final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970, 8),
        lastDate: DateTime(2023));
    if (datePicked != null && datePicked != _startDate) {
      _startDate = datePicked;
      update();
      final TimeOfDay? timePicked = await showTimePicker(
          context: context,
          initialTime:
              TimeOfDay(hour: datePicked.hour, minute: datePicked.minute));
      if (timePicked != null) {
        _startTime = timePicked;
        update();
      }
    }
  }

  bool _anotherReceiver = false;

  bool get anotherReceiver => _anotherReceiver;

  void toggleReceiver() {
    _anotherReceiver = !_anotherReceiver;
    update();
  }
}
