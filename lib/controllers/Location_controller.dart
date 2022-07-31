import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'dart:io' show Platform;

class LocationController extends GetxController {
  bool _startLocationPicked = false;

  bool get startLocationPicked => _startLocationPicked;

  bool _endLocationPicked = false;

  bool get endLocationPicked => _endLocationPicked;

  final kGoogleApiKey = "AIzaSyCgBcmRxPDyddm0cL8jqRm9ZMGKRtFpw78";

  void pickStartLocation(BuildContext context) async {
    Prediction? p = await PlacesAutocomplete.show(
        offset: 0,
        radius: 1000,
        types: [],
        strictbounds: false,
        region: "ar",
        context: context,
        apiKey: kGoogleApiKey,
        mode: Mode.overlay,
        // Mode.fullscreen
        language: "en",
        components: [Component(Component.country, "sa")]);

    displayPrediction(p);
    print(p?.description);

    _startLocationPicked = _startLocationPicked;
    update();
  }

  Future<Null> displayPrediction(Prediction? p) async {
    if (p != null) {
      // get detail (lat/lng)
      GoogleMapsPlaces _places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        // apiHeaders: await GoogleApiHeaders().getHeaders(),
      );
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId ?? '');
      final lat = detail.result.geometry?.location.lat;
      final lng = detail.result.geometry?.location.lng;

      Get.snackbar("${p.description} - $lat/$lng", '');
    }
  }

  void pickEndLocation() {
    _endLocationPicked = true;
    update();
  }
}
