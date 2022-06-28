import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/ui/screens/new_order_map.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/map_widgets/from_to_widget.dart';

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
              Expanded(
                  child: TabBarView(
                children: [RunningOrdersWidget(), HistoryOrdersWidget()],
              ))
            ])));
  }
}

class RunningOrdersWidget extends StatefulWidget {
  RunningOrdersWidget({Key? key}) : super(key: key);

  @override
  State<RunningOrdersWidget> createState() => _RunningOrdersWidgetState();
}

class _RunningOrdersWidgetState extends State<RunningOrdersWidget> {
  List<DropdownMenuItem<String>> _paymentMethods = [
    const DropdownMenuItem(child: Text("Cash"), value: "Cash"),
    const DropdownMenuItem(child: const Text("Visa"), value: "Visa"),
  ];

  TextEditingController _startDateController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _detailsContoller = TextEditingController();

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

  showBottomSheet() {
    Get.bottomSheet(Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
                width: 400.w,
                child: DropdownButtonFormField(
                  items: _paymentMethods,
                  hint: Text('paymentMethod'.tr),
                  onChanged: (String? newValue) {},
                  validator: (value) {
                    if (value == null) {
                      return 'Please choose a payment method';
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                )),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 180.w,
                  child: TextFormField(
                    controller: _startDateController,
                    // textInputAction: TextInputAction.next,
                    // onEditingComplete: () => _cityNode.requestFocus(),
                    enabled: false,
                    keyboardType: TextInputType.text,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabled: false,
                        hintText: 'startDate'.tr,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.grey[400]!,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: 180.w,
                  child: TextFormField(
                    controller: _startDateController,
                    // textInputAction: TextInputAction.next,
                    // onEditingComplete: () => _cityNode.requestFocus(),
                    enabled: false,
                    keyboardType: TextInputType.text,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabled: false,
                        hintText: 'startTime'.tr,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.grey[400]!,
                          ),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 400.w,
              child: TextFormField(
                controller: _detailsContoller,
                textInputAction: TextInputAction.done,
                enabled: true,
                maxLines: 4,
                // validator: (value) {
                //   if (GetUtils.isLengthLessThan(value, 5))
                //     return 'Please enter your Birth Date';
                // },
                keyboardType: TextInputType.text,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabled: true,
                    hintText: 'shipmentDetails'.tr,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                        width: 2.0,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.grey[400]!, width: 2),
                    )),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GradientButton('confirmOrder'.tr, () async {
              Get.back();
              await Future.delayed(Duration(milliseconds: 300));
              Get.to(() => NewOrderMap());
            }),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
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
        return const Padding(
          padding: EdgeInsets.all(10),
          child: FromTo(
            withDriverDetails: true,
          ),
        );
      },
    );
  }
}
