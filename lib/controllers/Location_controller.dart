import 'package:flutter/cupertino.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_map_location_picker_flutter/google_map_location_picker_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class LocationController extends GetxController {
  bool _startLocationPicked = false;

  bool get startLocationPicked => _startLocationPicked;

  bool _endLocationPicked = false;

  bool get endLocationPicked => _endLocationPicked;

  final kGoogleApiKey = "AIzaSyCgBcmRxPDyddm0cL8jqRm9ZMGKRtFpw78";

  void pickStartLocation(BuildContext context) async {



    _startLocationPicked = _startLocationPicked;
    update();
  }


  void pickEndLocation() {
    _endLocationPicked = true;
    update();
  }
}
