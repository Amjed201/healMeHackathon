import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logistic/models/offer.dart';
import 'package:logistic/services/apiService.dart';
import 'package:location/location.dart';

class MapController extends GetxController {
  final api = Get.find<ApiService>();

  bool _loading = false;
  List<Deals> _nearbyOffers = [];

  List<Deals> get nearbyOffers => _nearbyOffers;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    update();
  }

  late LatLng _userLocation;

  LatLng get userLocation => _userLocation;

  final Location _location = Location();

  getUserLocation(BuildContext context) async {
    _loading = true;
    update();
    try {
      _location.requestPermission(); //to lunch location permission popup

      LocationData loc = await _location.getLocation();

      _userLocation = LatLng(loc.latitude!, loc.longitude!);
      print('${loc.latitude} + ${loc.longitude}');
      _loading = false;
      update();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('Permission denied');
      }
      _loading = false;
      update();
    }
    getNearbyOffers(context: context);
  }

  getNearbyOffers({
    required BuildContext context,
  }) async {
    try {
      _loading = true;
      update();
      _nearbyOffers = await api.nearbyOffers(
          context,
          _userLocation.latitude.toString(),
          _userLocation.longitude.toString());
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }
}
