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
import 'package:logistic/ui/widgets/notificationButton.dart';
import 'package:logistic/ui/widgets/settingsButton.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            zoomControlsEnabled: true,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),

                    ///app bar
                    SizedBox(
                      width: 428.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          NotificationButton(),
                          Spacer(),
                          SettingsButton(),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),

                    Container(
                      width: 400.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 15.h,
                                  backgroundColor:
                                      Theme.of(context).secondaryHeaderColor,
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Column(
                                  children: [
                                    AutoSizeText(
                                      'completeInfo'.tr,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    AutoSizeText(
                                      'completeInfo'.tr,
                                      style: TextStyle(
                                        color: Theme.of(context).hintColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // SizedBox(height: 30.h,),

                            ///fix vertical divider
                            SizedBox(
                              height: 30.h,
                            ),
                            //     child: VerticalDivider(color: Colors.black,thickness: 2,width: 2,indent: 1.h,endIndent: 30.h,)),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 15.h,
                                  backgroundColor:
                                      Theme.of(context).secondaryHeaderColor,
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Column(
                                  children: [
                                    AutoSizeText(
                                      'completeInfo'.tr,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    AutoSizeText(
                                      'completeInfo'.tr,
                                      style: TextStyle(
                                        color: Theme.of(context).hintColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 330.h,
                    // ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: 400.w,
                // height: 80.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.directions_car,
                      size: 50.h,
                    ),
                    title: AutoSizeText(
                      'completeInfo'.tr,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    subtitle: AutoSizeText(
                      'completeInfo'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      size: 40.h,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GradientButton(
                  'continue'.tr, () => Get.to(() => RequestScreen()), 85.h),
              SizedBox(
                height: 30.h,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 79.h,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          AutoSizeText(
                            'currentOrders'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircleAvatar(
                        radius: 30.h,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      )),
    );
  }
}
