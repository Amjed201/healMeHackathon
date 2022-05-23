import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/ui/screens/new_order_map.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/order_card.dart';

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
            child: Column(children: [
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
              ))
            ])));
  }
}

class RunningOrdersWidget extends StatelessWidget {
  const RunningOrdersWidget({Key? key}) : super(key: key);

  showBottomSheet() {
    Get.bottomSheet(Container(
      height: 500.h,
      color: Colors.white,
      child: Column(
        children: [
          Spacer(),
          GradientButton('confirmOrder'.tr, () async {
            Get.back();
            await Future.delayed(Duration(milliseconds: 300));
            Get.to(() => NewOrderMap());
          }),
          SizedBox(height: 20.h,)
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pending_actions,
              size: 50,
              color: Theme.of(context).focusColor,
            ),
            AutoSizeText(
              'noCurrentOrders'.tr,
              style: TextStyle(color: Theme.of(context).focusColor),
            ),
          ],
        )),
        Positioned(
            left: 0,
            right: 0,
            bottom: 50.h,
            child: GradientButton('newOrder'.tr, showBottomSheet))
      ],
    );
  }
}

class HistoryOrdersWidget extends StatelessWidget {
  const HistoryOrdersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return OrderCard();
        });
  }
}
