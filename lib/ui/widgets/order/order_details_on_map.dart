import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/map_widgets/from_to_widget.dart';
import 'package:logistic/ui/widgets/order/driver_details.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'order_details_widget.dart';

class OrderDetailsOnMap extends StatefulWidget {
  const OrderDetailsOnMap({Key? key}) : super(key: key);

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
          'completeInfo'.tr,
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
              maxHeight: 560.h,
              minHeight: 150.h,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FromTo(
                  withDriverDetails: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
