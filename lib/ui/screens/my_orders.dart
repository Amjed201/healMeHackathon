import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/map_widgets/from_to_widget.dart';
import 'package:logistic/ui/widgets/order/order_details_on_map.dart';

import '../widgets/order/create_order.dart';
import '../widgets/suspended_account_popup.dart';

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
            Expanded(
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
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970, 8),
        lastDate: DateTime(2023));
    if (picked != null) {
      // setState(() {
      //   birthDate = picked;
      //   _birthController.text = DateFormat('y-MM-d').format(birthDate!);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        return Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () => Get.to(() => const OrderDetailsOnMap()),
            child: const FromTo(
              withDriverDetails: true,
            ),
          ),
        );
      },
    );
  }
}
