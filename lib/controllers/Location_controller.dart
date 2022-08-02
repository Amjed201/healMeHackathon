import 'dart:collection';
import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart'
    as polyline;
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logistic/controllers/create_order_controller.dart';
import 'package:logistic/services/helpers.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class LocationController extends GetxController {
  bool _startLocationPicked = false;

  bool get startLocationPicked => _startLocationPicked;

  bool _endLocationPicked = false;

  bool get endLocationPicked => _endLocationPicked;

  String _startLocationName = '';

  String get startLocationName => _startLocationName;

  LatLng? _startLocationLatLng;

  LatLng? get startLocationLatLng => _startLocationLatLng;

  set startLocationLatLng(LatLng? value) {
    _startLocationLatLng = value;
  }

  set endLocationLatLng(LatLng? value) {
    _endLocationLatLng = value;
  }

  LatLng? _endLocationLatLng;

  LatLng? get endLocationLatLng => _endLocationLatLng;

  String _endLocationName = '';

  String get endLocationName => _endLocationName;

  final kGoogleApiKey = "AIzaSyCgBcmRxPDyddm0cL8jqRm9ZMGKRtFpw78";

  late GoogleMapController _mapController;

  GoogleMapController get mapController => _mapController;

  set mapController(GoogleMapController value) {
    _mapController = value;
  }

  void pickLocation(BuildContext context, LatLng? position,
      {required bool isStartLocation}) async {
    ///get LatLng
    if (isStartLocation) {
      _startLocationPicked = true;
      update();
      LatLng latLng = position!;
      _startLocationLatLng = latLng;
      mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 14));

      /// origin marker
      addMarker(latLng, "origin", BitmapDescriptor.defaultMarker);
      _startLocationName = await getAddressFromLatLong(latLng);
    } else {
      _endLocationPicked = true;
      update();
      LatLng latLng = position!;
      _endLocationLatLng = latLng;
      mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 14));

      /// origin marker
      addMarker(latLng, "destination", BitmapDescriptor.defaultMarker);
      _endLocationName = await getAddressFromLatLong(latLng);
      Get.find<CreateOrderController>().calculateVehiclePrice(
          vehicleId:
              Get.find<CreateOrderController>().selectedVehicle?.id ?? 0);
    }

    // if (_startLocationPicked && _endLocationPicked) getPolyline();
    update();
  }

  void searchLocation(BuildContext context,
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
        mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 14));

        /// origin marker
        addMarker(latLng, "origin", BitmapDescriptor.defaultMarker);
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
        mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 14));

        /// origin marker
        addMarker(latLng, "destination", BitmapDescriptor.defaultMarker);

        Get.find<CreateOrderController>().calculateVehiclePrice(
            vehicleId:
            Get.find<CreateOrderController>().selectedVehicle?.id ?? 0);
      }

      // if (_startLocationPicked && _endLocationPicked) getPolyline();
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

  ////////////////////////////////////////////////////////////////////////////////

  Future<String> getAddressFromLatLong(LatLng position) async {
    List placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    String address = '${place.street}, ${place.subLocality}, ${place.country}';
    return address;
  }

//////////////////////////////////////////////////////////////////////////////////
  ///Draw polyline
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  polyline.PolylinePoints polylinePoints = polyline.PolylinePoints();

  addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.green[600]!, points: polylineCoordinates);
    polylines[id] = polyline;
    update();
  }

  getPolyline() async {
    polylines = {};
    polyline.PolylineResult result = await polylinePoints
        .getRouteBetweenCoordinates(
            'AIzaSyCgBcmRxPDyddm0cL8jqRm9ZMGKRtFpw78',
            polyline.PointLatLng(
                startLocationLatLng!.latitude, startLocationLatLng!.longitude),
            polyline.PointLatLng(
                endLocationLatLng!.latitude, endLocationLatLng!.longitude),
            travelMode: polyline.TravelMode.driving,
            wayPoints: [polyline.PolylineWayPoint(location: "KSA")]);
    if (result.points.isNotEmpty) {
      result.points.forEach((polyline.PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    addPolyLine();
  }
}
