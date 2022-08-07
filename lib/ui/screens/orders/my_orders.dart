import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/my_orders_controller.dart';
import 'package:logistic/data/models/order.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/map_widgets/from_to_widget.dart';
import 'package:logistic/ui/widgets/order/order_details_on_map.dart';

import '../../widgets/order/create_order.dart';
import '../../widgets/suspended_account_popup.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: AutoSizeText(
          'Logo'.tr,
          style: TextStyle(
              fontSize: 24.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Theme.of(context).secondaryHeaderColor,
              labelColor: Theme.of(context).secondaryHeaderColor,
              unselectedLabelColor: Colors.grey[600],
              indicatorWeight: 3,
              tabs: [
                Tab(
                  text: "runningOrders".tr,
                ),
                Tab(
                  text: "historyOrders".tr,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const Expanded(
              child: TabBarView(
                children: [RunningOrdersWidget(), HistoryOrdersWidget()],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RunningOrdersWidget extends StatefulWidget {
  const RunningOrdersWidget({Key? key}) : super(key: key);

  @override
  State<RunningOrdersWidget> createState() => _RunningOrdersWidgetState();
}

class _RunningOrdersWidgetState extends State<RunningOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOrdersController>(builder: (controller) {
      return controller.runningOrders.isNotEmpty
          ? Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const SuspendedAccount(),
                          );
                        },
                        child: Icon(
                          Icons.pending_actions,
                          size: 50,
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                      AutoSizeText(
                        'noCurrentOrders'.tr,
                        style: TextStyle(color: Theme.of(context).focusColor),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 50.h,
                  child: GradientButton(
                    'newOrder'.tr,
                    () => Get.to(
                      () => const CreateOrderSheet(),
                    ),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                Order order = controller.runningOrders[index];
                return OrderCard(
                    order: order, withDriverDetails: order.assignedBid != null);
              },
              itemCount: controller.runningOrders.length,
            );
    });
  }
}

class HistoryOrdersWidget extends StatelessWidget {
  const HistoryOrdersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOrdersController>(builder: (controller) {
      return controller.previousOrders.isNotEmpty
          ? Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const SuspendedAccount(),
                          );
                        },
                        child: Icon(
                          Icons.pending_actions,
                          size: 50,
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                      AutoSizeText(
                        'noCurrentOrders'.tr,
                        style: TextStyle(color: Theme.of(context).focusColor),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 50.h,
                  child: GradientButton(
                    'newOrder'.tr,
                    () => Get.to(
                      () => const CreateOrderSheet(),
                    ),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                Order order = controller.previousOrders[index];
                return OrderCard(
                    order: order, withDriverDetails: order.assignedBid != null);
              },
              itemCount: controller.previousOrders.length,
            );
    });
  }
}

class OrderCard extends StatelessWidget {
  final bool withDriverDetails;
  final Order order;

  const OrderCard(
      {Key? key, required this.order, required this.withDriverDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Container(
        padding: EdgeInsets.only(
          top: 18.h,
          bottom: withDriverDetails ? 0 : 18.h,
        ),
        height: withDriverDetails ? 215.h : 150.h,
        width: 382.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(360),
                          border: Border.all(
                            width: 1.w,
                            color: Colors.grey[400]!,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 13,
                          child: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).secondaryHeaderColor,
                            radius: 10.w,
                            child: CircleAvatar(
                              radius: 4.w,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        height: 5.h,
                        width: 2.w,
                        color: Colors.grey[400],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        height: 5.h,
                        width: 2.w,
                        color: Colors.grey[400],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        height: 5.h,
                        width: 2.w,
                        color: Colors.grey[400],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        height: 5.h,
                        width: 2.w,
                        color: Colors.grey[400],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(360),
                          border: Border.all(
                            width: 1.w,
                            color: Colors.grey[200]!,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 13,
                          child: CircleAvatar(
                            radius: 10.w,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 3.w,
                              backgroundColor:
                                  Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    children: [
                      Text(
                        order.pickupLocationLat ?? '',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        "startPoint".tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        order.dropOffLocationLat ?? '',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        "endPoint".tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: withDriverDetails ? 19.h : 0,
            ),
            !withDriverDetails
                ? const SizedBox()
                : Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                radius: (43 / 2).h,
                                child: Icon(
                                  Icons.person,
                                  size: 30.h,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'driver name',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Text(
                                    'vehicle'.tr + order.vehicleType.toString(),
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            'status'.tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
