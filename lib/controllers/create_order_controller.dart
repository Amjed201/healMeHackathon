import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/zone_controller.dart';
import 'package:logistic/data/api/api_checker.dart';
import 'package:logistic/data/models/city.dart';
import 'package:logistic/data/models/region.dart';
import 'package:http/http.dart' as http;
import 'package:logistic/data/models/vehicle.dart';
import 'package:logistic/data/repository/order_repo.dart';

class CreateOrderController extends GetxController {
  final orderRepo = Get.find<OrderRepo>();
  final zoneController = Get.find<ZoneController>();

  List<DropdownMenuItem<String>> paymentMethods = [
    const DropdownMenuItem(child: Text("Cash"), value: "Cash"),
    const DropdownMenuItem(child: Text("Visa"), value: "Visa"),
  ];

  List<DropdownMenuItem<Region>> _regions = [];

  List<DropdownMenuItem<Region>> get regions => _regions;

  set regions(List<DropdownMenuItem<Region>> value) {
    _regions = value;
  }

  List<DropdownMenuItem<City>> _cities1 = [];

  List<DropdownMenuItem<City>> get cities1 => _cities1;

  set cities1(List<DropdownMenuItem<City>> value) {
    _cities1 = value;
    update();
  }

  List<DropdownMenuItem<City>> _cities2 = [];

  List<DropdownMenuItem<City>> get cities2 => _cities2;

  set cities2(List<DropdownMenuItem<City>> value) {
    _cities2 = value;
    update();
  }

  getZonesAndVehicles() async {
    await zoneController.getCities();
    await zoneController.getRegions();
    await zoneController.getVehicles();

    updateZonesList();
    setVehiclesDropdown();
  }

  setVehiclesDropdown() {
    List<Vehicle> vehicles = Get.find<ZoneController>().vehicles;
    for (var vehicle in vehicles) {
      vehiclesDropdownList.add(DropdownMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(vehicle.vehicleNameEn ?? ''),
              SizedBox(
                height: 40,
                width: 76,
                child: Image.asset('assets/images/car_placeholder.png'),
              ),
            ],
          ),
          value: vehicle));
    }
  }

  updateZonesList() {
    List<Region> regionsList = zoneController.regions;
    List<City> cityList = zoneController.cities;

    regions = [];
    for (var region in regionsList) {
      regions.add(
          DropdownMenuItem(child: Text(region.nameAr ?? ''), value: region));
    }

    cities1 = [];
    cities2 = [];
    for (var city in cityList) {
      if (_selectedRegion1 != null) {
        _cities1.addIf(city.regionId == _selectedRegion1?.id,
            DropdownMenuItem(child: Text(city.nameAr ?? ''), value: city));
      } else {
        _cities1
            .add(DropdownMenuItem(child: Text(city.nameAr ?? ''), value: city));
      }

      if (_selectedRegion2 != null) {
        _cities2.addIf(city.regionId == _selectedRegion2?.id,
            DropdownMenuItem(child: Text(city.nameAr ?? ''), value: city));
      } else {
        _cities2
            .add(DropdownMenuItem(child: Text(city.nameAr ?? ''), value: city));
      }
    }
  }

  List<DropdownMenuItem<Vehicle>> _vehiclesDropdownList = [];

  List<DropdownMenuItem<Vehicle>> get vehiclesDropdownList =>
      _vehiclesDropdownList;

  set vehiclesDropdownList(List<DropdownMenuItem<Vehicle>> value) {
    _vehiclesDropdownList = value;
  }

  Vehicle? _selectedVehicle;

  Vehicle? get selectedVehicle => _selectedVehicle;

  set selectedVehicle(Vehicle? value) {
    _selectedVehicle = value;
    // update();
  }

  changeVehicle(Vehicle vehicle) {
    selectedVehicle = vehicle;
    update();
    calculateVehiclePrice(vehicleId: vehicle.id ?? 0, distance: '40');
  }

  Region? _selectedRegion1;

  Region? get selectedRegion1 => _selectedRegion1;

  set selectedRegion1(Region? value) {
    _selectedRegion1 = value;
    update();
  }

  Region? _selectedRegion2;

  Region? get selectedRegion2 => _selectedRegion2;

  set selectedRegion2(Region? value) {
    _selectedRegion2 = value;
    _autoPickRegion = false;
    update();
  }

  bool _autoPickRegion = true;

  bool get autoPickRegion => _autoPickRegion;

  City? _selectedCity1;

  City? get selectedCity1 => _selectedCity1;

  set selectedCity1(City? value) {
    _selectedCity1 = value;
    update();
  }

  City? _selectedCity2;

  City? get selectedCity2 => _selectedCity2;

  set selectedCity2(City? value) {
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

  ///////////////////////////////////////////////////////////////////////////////////////
  ///price calculation

  bool _loading = false;

  bool get loading => _loading;

  String? _price;

  String? get price => _price;

  void calculateVehiclePrice(
      {required int vehicleId, required String distance}) async {
    _loading = true;
    update();
    http.Response response = await orderRepo.calculatePrice(
        vehicleId: vehicleId, distance: distance);
    Map<String, dynamic> responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      _price = responseMap["price"].toString();
      _loading = false;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }




}
