import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logistic/controllers/order_status_controller.dart';
import 'package:logistic/data/models/order.dart';
import 'package:logistic/ui/screens/orders/my_orders.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/global/loading.dart';
import 'package:logistic/ui/widgets/map_widgets/from_to_widget.dart';
import 'package:logistic/ui/widgets/order/driver_details.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
  final TextEditingController _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(
      builder: (controller) {
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
              InkWell(
                onTap: () {
                  showMaterialModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) =>
                        GetBuilder<OrderStatusController>(
                            builder: (orderStatusController) {
                              return Container(
                                height: 400,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 24.w,
                                        vertical: 8.h,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 24.w,
                                        vertical: 19.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          AutoSizeText(
                                            "Reason 1",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 24.w,
                                        vertical: 8.h,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 24.w,
                                        vertical: 19.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          AutoSizeText(
                                            "Reason 2",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 24.w,
                                        vertical: 8.h,
                                      ),
                                      child: TextFormField(
                                        controller: _reasonController,
                                        textInputAction: TextInputAction.done,
                                        enabled: true,
                                        maxLines: 3,
                                        keyboardType: TextInputType.text,
                                        cursorColor: Theme
                                            .of(context)
                                            .primaryColor,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabled: true,
                                          hintText: 'reasons'.tr,
                                          contentPadding: const EdgeInsets
                                              .fromLTRB(
                                              20.0, 15.0, 20.0, 15.0),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                12.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey[400]!,
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                12.0),
                                            borderSide: BorderSide(
                                              color: Theme
                                                  .of(context)
                                                  .primaryColor,
                                              width: 2.0,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                12.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey[400]!,
                                              width: 2.0,
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                12.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey[400]!,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    orderStatusController.loading
                                        ? const LoadingWidget()
                                        : GradientButton('cancel'.tr, () {
                                      String reason = _reasonController.text;
                                      orderStatusController.cancelOrder(
                                          orderId: widget.order.id ?? 0,
                                          reason: reason);
                                    })
                                  ],
                                ),
                              );
                            }),
                  );
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: AutoSizeText(
                      'cancelOrder'.tr,
                      style: TextStyle(color: Colors.red[700]),
                    ),
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
                        Get.find<OrderStatusController>()
                            .getOrderStatus(widget.order.status ?? ''),
                            () {
                          Get.find<OrderStatusController>().
                          changeOrderStatus(orderId: widget.order.id ?? 0,
                              orderStatus: widget.order.status ?? '');
                        },
                        isDisabled: widget.order.status == 'PendingStart',
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
                                OrderDetailsWidget(widget.order)
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
                                backgroundColor: Theme
                                    .of(context)
                                    .primaryColor,
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
      },
    );
  }
}
