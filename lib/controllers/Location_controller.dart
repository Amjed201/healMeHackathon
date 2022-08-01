import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:logistic/services/helpers.dart';

class LocationController extends GetxController {
  bool _startLocationPicked = false;

  bool get startLocationPicked => _startLocationPicked;

  bool _endLocationPicked = false;

  bool get endLocationPicked => _endLocationPicked;

  String _startLocationName = '';

  String get startLocationName => _startLocationName;

  LatLng? _startLocationLatLng;

  LatLng? get startLocationLatLng => _startLocationLatLng;

  LatLng? _endLocationLatLng;

  LatLng? get endLocationLatLng => _endLocationLatLng;

  String _endLocationName = '';

  String get endLocationName => _endLocationName;

  final kGoogleApiKey = "AIzaSyCgBcmRxPDyddm0cL8jqRm9ZMGKRtFpw78";

  void pickLocation(BuildContext context,
      {required bool isStartLocation}) async {
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

    ///get LatLng
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
    );
    if (p != null) {
      if (isStartLocation) {
        _startLocationName = p.description ?? '';
        _startLocationPicked = true;
        update();
        PlacesDetailsResponse detail =
            await _places.getDetailsByPlaceId(p.placeId ?? '');
        final lat = detail.result.geometry?.location.lat;
        final lng = detail.result.geometry?.location.lng;
        LatLng latLng = LatLng(lat!, lng!);
        _startLocationLatLng = latLng;
      } else {
        _endLocationName = p.description ?? '';
        _endLocationPicked = true;
        update();
        PlacesDetailsResponse detail =
            await _places.getDetailsByPlaceId(p.placeId ?? '');
        final lat = detail.result.geometry?.location.lat;
        final lng = detail.result.geometry?.location.lng;
        LatLng latLng = LatLng(lat!, lng!);
        _endLocationLatLng = latLng;
      }
    }
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

      showToast("${p.description} - $lat/$lng");
    }
  }
}
