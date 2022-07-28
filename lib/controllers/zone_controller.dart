import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:logistic/data/api/api_checker.dart';
import 'package:logistic/data/models/city.dart';
import 'package:logistic/data/models/country.dart';
import 'package:logistic/data/models/region.dart';
import 'package:logistic/data/models/town.dart';
import 'package:logistic/data/models/vehicle.dart';
import 'package:logistic/data/repository/zone_repo.dart';
import 'package:logistic/services/localStorage.dart';

class ZoneController extends GetxController {
  final zoneRepo = Get.find<ZoneRepo>();
  final storage = Get.find<LocalStorage>();

  bool _loading = false;

  bool get loading => _loading;


  List<Country> _countries = [];
  List<Country> get countries => _countries;
  set countries(List<Country> value) {
    _countries = value;
    update();
  }


  List<Region> _regions = [];
  List<Region> get regions => _regions;
  set regions(List<Region> value) {
    _regions = value;
    update();
  }


  List<City> _cities = [];
  List<City> get cities => _cities;
  set cities(List<City> value) {
    _cities = value;
    update();
  }

  List<Town> _towns = [];
  List<Town> get towns => _towns;
  set towns(List<Town> value) {
    _towns = value;
    update();
  }

  List<Vehicle> _vehicles = [];
  List<Vehicle> get vehicles => _vehicles;
  set vehicles(List<Vehicle> value) {
    _vehicles = value;
    update();
  }

  Future<List<Region>> getRegions() async {
    _loading = true;
    update();
    http.Response response = await zoneRepo.getAllRegions();
    if (response.statusCode == 200) {
      List dataList = json.decode(response.body);
      _regions = dataList.map((e) => Region.fromJson(e)).toList();
      _loading = false;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
    return _regions;
  }

  Future<List<City>> getCities() async {
    _loading = true;
    update();
    http.Response response = await zoneRepo.getAllCities();
    if (response.statusCode == 200) {
      List dataList = json.decode(response.body);
      _cities = dataList.map((e) => City.fromJson(e)).toList();
      _loading = false;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
    return _cities;
  }


  ///Vehicles

  Future<List<Vehicle>> getVehicles() async {
    _loading = true;
    update();
    http.Response response = await
    zoneRepo.getVehicles();
    if (response.statusCode == 200) {
      List dataList = json.decode(response.body);
      _vehicles = dataList.map((e) => Vehicle.fromJson(e)).toList();
      _loading = false;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
    return _vehicles;
  }
















}
