import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logistic/controllers/Location_controller.dart';
import 'package:logistic/controllers/contacts_controller.dart';
import 'package:logistic/controllers/zone_controller.dart';
import 'package:logistic/data/api/api_checker.dart';
import 'package:logistic/data/models/city.dart';
import 'package:logistic/data/models/region.dart';
import 'package:http/http.dart' as http;
import 'package:logistic/data/models/vehicle.dart';
import 'package:logistic/data/repository/create_order_repo.dart';
import 'package:logistic/services/helpers.dart';
import 'package:logistic/services/localStorage.dart';
import 'package:logistic/ui/screens/orders/new_order_map.dart';
import 'package:logistic/ui/screens/tabs_screen.dart';

class CreateOrderController extends GetxController {
  final orderRepo = Get.find<CreateOrderRepo>();
  final zoneController = Get.find<ZoneController>();

  List<DropdownMenuItem<String>> paymentMethods = [
    const DropdownMenuItem(child: Text("Cash"), value: "Cash"),
    const DropdownMenuItem(child: Text("Visa"), value: "Visa"),
  ];

  String? _selectedPayment;

  set selectedPayment(String? value) {
    _selectedPayment = value;
  }

  String _orderNotes = '';

  String get orderNotes => _orderNotes;

  set orderNotes(String value) {
    _orderNotes = value;
  }

  String? get selectedPayment => _selectedPayment;
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
    calculateVehiclePrice(vehicleId: vehicle.id ?? 0);
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

  void confirmOrder() async {
    if (_selectedCity1 == null ||
        _selectedCity2 == null ||
        _selectedRegion1 == null ||
        _selectedRegion2 == null ||
        _selectedPayment == null ||
        _startTime == null ||
        _startDate == null ||
        detailsController.text == '') {
      showToast('الرجاء ملأ الحقول ');
    } else {
      ///add contact first then go to map screen
      if (_anotherReceiver) {
        createNewContact();
      } else {
        Get.to(() => const NewOrderMap());
      }
    }
  }

  void createNewContact() async {
    if (reciverController.text.length == 0 ||
        reciverPhoneController.text.length == 0) {
      showToast('الرجاء ملأ الحقول ');
    } else {
      _loading = true;
      update();
      await Get.find<ContactsController>().addNewContact(
          addFromOrder: true,
          name: reciverController.text,
          countryCode: '+249',
          primaryPhone: reciverPhoneController.text,
          secondaryPhone: reciverPhoneController2.text.length == 0
              ? null
              : reciverPhoneController2.text);
      _loading = false;
      update();
      Get.to(
        () => const NewOrderMap(),
      );
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////
  ///price calculation

  bool _loading = false;

  bool get loading => _loading;

  String? _price;

  String? get price => _price;

  void calculateVehiclePrice({required int vehicleId}) async {
    LatLng originLoc = Get.find<LocationController>().startLocationLatLng!;
    LatLng destinationLoc = Get.find<LocationController>().endLocationLatLng!;

    double distanceInMeters = Geolocator.distanceBetween(originLoc.latitude,
        originLoc.longitude, destinationLoc.latitude, destinationLoc.longitude);

    print('DIstance is :          $distanceInMeters');

    _loading = true;
    update();
    http.Response response = await orderRepo.calculatePrice(
        vehicleId: vehicleId, distance: distanceInMeters);
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

  ////////////////////////////////////

  void sendOrder() async {
    print('ddddddddddddddddddddddddddd');
    LocationController location = Get.find<LocationController>();
    _startDate = DateTime(_startDate!.year, _startDate!.month, _startDate!.day,
        _startTime!.hour, _startTime!.minute);
    _loading = true;
    update();

    print(_startDate?.toUtc().toIso8601String());

    http.Response response = await orderRepo.createOrder(
        token: Get.find<LocalStorage>().getToken()!,
        pickupTime: '2020-01-01T00:00:00.000Z',
        paymentType:
            _selectedPayment == 'Cash' ? 'CashOnDropOff' : 'CreditCard',
        pickupCityId: _selectedCity1?.id,
        pickupRegionId: _selectedRegion1?.id,
        dropOffCityId: _selectedCity2?.id,
        dropOffRegionId: selectedRegion2?.id,

        ///make contact id optional
        contactId: Get.find<ContactsController>().selectedContact == null
            ? 1
            : Get.find<ContactsController>().selectedContact?.id!,

        ///make details optional
        details:
            detailsController.text == 'empty' ? '' : detailsController.text,
        pickupLat: location.startLocationLatLng?.latitude.toString(),
        pickupLng: location.startLocationLatLng?.longitude.toString(),
        dropOffLng: location.endLocationLatLng?.longitude.toString(),
        dropOffLat: location.endLocationLatLng?.latitude.toString(),
        vehicleType: _selectedVehicle?.id);
    if (response.statusCode == 200) {
      _loading = false;
      update();
      showToast('addedSuccess'.tr);
      Get.offAll(() => TabsScreen());
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }
}
