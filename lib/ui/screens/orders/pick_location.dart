import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logistic/controllers/Location_controller.dart';
import 'package:logistic/controllers/auth_controller.dart';
import 'package:logistic/controllers/create_order_controller.dart';
import 'package:logistic/ui/screens/orders/requests_screen.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/map_widgets/from_to_widget.dart';
import 'package:logistic/ui/widgets/map_widgets/vechial_details_on_map.dart';
import 'package:logistic/ui/widgets/notificationButton.dart';
import 'package:logistic/ui/widgets/settingsButton.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class PickLocation extends StatefulWidget {
  bool isEndLocation;

  PickLocation({required this.isEndLocation});

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  final auth = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CreateOrderController>().selectedVehicle =
        Get.find<CreateOrderController>().vehiclesDropdownList.first.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
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
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: false,
            padding: EdgeInsets.symmetric(vertical: 240.h),
            onMapCreated: (GoogleMapController controller) {},
          ),
          Positioned(
            top: 40.h,
            left: 0,
            right: 0,
            child: GradientButton(
              'location'.tr,
              () => Get.find<LocationController>().searchLocation(context,
                  isStartLocation:true),
            ),
          ),
          Positioned(
            bottom: 40.h,
            left: 0,
            right: 0,
            child: GradientButton(
              'continue'.tr,
              () {}
              ),
            ),
        ],
      )),
    );
  }
}
