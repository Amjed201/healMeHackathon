import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logistic/controllers/Location_controller.dart';
import 'package:logistic/controllers/auth_controller.dart';
import 'package:logistic/controllers/create_order_controller.dart';
import 'package:logistic/services/helpers.dart';
import 'package:logistic/ui/screens/orders/requests_screen.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/global/loading.dart';
import 'package:logistic/ui/widgets/map_widgets/from_to_widget.dart';
import 'package:logistic/ui/widgets/map_widgets/vechial_details_on_map.dart';
import 'dart:collection';
import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/services.dart';

class NewOrderMap extends StatefulWidget {
  const NewOrderMap({Key? key}) : super(key: key);

  @override
  State<NewOrderMap> createState() => _NewOrderMapState();
}

class _NewOrderMapState extends State<NewOrderMap> {
  final auth = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get
        .find<CreateOrderController>()
        .selectedVehicle =
        Get
            .find<CreateOrderController>()
            .vehiclesDropdownList
            .first
            .value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GetBuilder<LocationController>(
        builder: (locationController) =>
            GetBuilder<CreateOrderController>(builder: (orderController) {
              return
                orderController.orderLoading?
                    const LoadingWidget():
                SafeArea(
                  child: Stack(
                    children: [
                      GoogleMap(
                          initialCameraPosition: const CameraPosition(
                            target: LatLng(
                              15.5594,
                              32.5549,
                            ),
                            zoom: 18,
                          ),
                          onLongPress: (LatLng? position) {
                            if (locationController.startLocationLatLng == null) {
                              locationController.startLocationLatLng = position!;
                              locationController.pickLocation(context, position,
                                  isStartLocation: true);

                              locationController.update();
                            } else {
                              locationController.endLocationLatLng = position!;
                              locationController.pickLocation(context, position,
                                  isStartLocation: false);
                              locationController.update();
                            }
                          },
                          zoomControlsEnabled: false,
                          myLocationButtonEnabled: false,
                          myLocationEnabled: false,
                          padding: EdgeInsets.symmetric(vertical: 240.h),
                          markers: Set<Marker>.of(locationController.markers.values),
                          polylines: Set<Polyline>.of(
                              locationController.polylines.values),
                          onMapCreated: _onMapCreated),
                      Column(
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          const FromTo(
                            withDriverDetails: false,
                          ),
                          const Spacer(),
                          VechialDetailsOnMap(),
                          SizedBox(
                            height: 20.h,
                          ),
                          GradientButton('continue'.tr, () {
                            if (Get
                                .find<LocationController>()
                                .startLocationPicked ==
                                false ||
                                Get
                                    .find<LocationController>()
                                    .endLocationPicked ==
                                    false) {
                              showToast('اختر الموقع');
                            } else {
                              Get.find<CreateOrderController>().sendOrder();
                            }
                          }),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ],
                  ));
            }),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    Get
        .find<LocationController>()
        .mapController = controller;
  }

  @override
  void dispose() {
    super.dispose();
    Get
        .find<LocationController>()
        .mapController
        .dispose();
  }
}
