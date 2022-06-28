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
import 'package:logistic/controllers/authController.dart';
import 'package:logistic/ui/screens/requests.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/map_widgets/from_to_widget.dart';
import 'package:logistic/ui/widgets/map_widgets/vechial_details_on_map.dart';
import 'package:logistic/ui/widgets/notificationButton.dart';
import 'package:logistic/ui/widgets/settingsButton.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class NewOrderMap extends StatefulWidget {
  const NewOrderMap({Key? key}) : super(key: key);

  @override
  State<NewOrderMap> createState() => _NewOrderMapState();
}

class _NewOrderMapState extends State<NewOrderMap> {
  final auth = Get.find<AuthController>();

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
                zoom: 18),
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: false,
            padding: EdgeInsets.symmetric(vertical: 240.h),
            // markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              // _controller = controller;
              // mapController.loading = false;
              // setMarker();
            },
          ),
          Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              const FromTo(
                withDriverDetails: false,
              ),
              const Spacer(),
              const VechialDetailsOnMap(),
              SizedBox(
                height: 20.h,
              ),
              GradientButton(
                'continue'.tr,
                () => Get.to(
                  () => const RequestScreen(),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
