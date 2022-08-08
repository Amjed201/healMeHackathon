import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logistic/data/models/order.dart';
import 'package:logistic/ui/screens/orders/my_orders.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/map_widgets/from_to_widget.dart';
import 'package:logistic/ui/widgets/order/driver_details.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'order_details_widget.dart';

class OrderDetailsOnMap extends StatefulWidget {
  Order order;

   OrderDetailsOnMap(this.order, {Key? key}) : super(key: key);

  @override
  State<OrderDetailsOnMap> createState() => _OrderDetailsOnMapState();
}

class _OrderDetailsOnMapState extends State<OrderDetailsOnMap> {
  var panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: AutoSizeText(
          'orderDetails'.tr,
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
        leading: const PopButton(),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: AutoSizeText(
                'cancelOrder'.tr,
                style: TextStyle(color: Colors.red[700]),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SlidingUpPanel(
              color: Colors.transparent,
              controller: panelController,
              maxHeight: 575.h,
              minHeight: 150.h,
              body: GoogleMap(
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
                // markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  // _controller = controller;
                  // mapController.loading = false;
                  // setMarker();
                },
              ),
              panel: Column(
                children: [
                  GradientButton(
                    'confirmLoading'.tr,
                    () {},
                  ),
                  Stack(
                    children: [
                      Container(
                        color: Colors.grey[100],
                        margin: EdgeInsets.only(top: 40.h),
                        height: 450.h,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: 42.h,
                            ),
                            Center(
                              child: Text(
                                'orderDetails'.tr,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            const DriverDetails(),
                            SizedBox(
                              height: 24.w,
                            ),
                            const OrderDetailsWidget()
                          ],
                        ),
                      ),
                      Positioned(
                        top: 17.h,
                        width: 428.w,
                        child: GestureDetector(
                          onTap: () async {
                            if (panelController.isPanelOpen) {
                              await panelController.close();
                            } else {
                              await panelController.open();
                            }
                            //Temp
                            setState(() {});
                          },
                          child: CircleAvatar(
                            child: Icon(
                              panelController.isAttached
                                  ? panelController.isPanelOpen
                                      ? Icons.keyboard_arrow_down_outlined
                                      : Icons.keyboard_arrow_up_outlined
                                  : Icons.keyboard_arrow_up_outlined,
                              color: Colors.white,
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.transparent,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                OrderCard(order: widget.order, withDriverDetails: false)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
