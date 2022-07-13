import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logistic/ui/screens/orders/new_order_map.dart';
import 'package:logistic/ui/widgets/global/dropdown_menu_widget.dart';
import 'package:logistic/ui/widgets/global/global_text_form.dart';
import 'package:logistic/ui/widgets/global/intermittent_line.dart';

import '../../../controllers/create_order_controller.dart';
import '../commonButton.dart';

class CreateOrderSheet extends GetView<CreateOrderController> {
  const CreateOrderSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createOrder = Get.put(CreateOrderController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'deliverFrom'.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      MySeparator(
                        width: 400.w,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DropDownWidget(
                  list: createOrder.cities,
                  label: 'chooseRegion',
                  padding: 24.w,
                ),
                SizedBox(
                  height: 17.h,
                ),
                DropDownWidget(
                  list: createOrder.cities,
                  label: 'chooseCity',
                  padding: 24.w,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'deliverTo'.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      MySeparator(
                        width: 400.w,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                DropDownWidget(
                  padding: 24.w,
                  list: createOrder.cities,
                  label: 'chooseRegion',
                ),
                SizedBox(
                  height: 17.h,
                ),
                DropDownWidget(
                  padding: 24.w,
                  list: createOrder.cities,
                  label: 'chooseCity',
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'deliveryDetails'.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      MySeparator(
                        width: 400.w,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DropDownWidget(
                  list: createOrder.paymentMethods,
                  label: 'paymentMethod',
                  padding: 24.w,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          createOrder.pickDate(context);
                        },
                        child: GetBuilder<CreateOrderController>(
                          builder: (_) => GlobalTextForm(
                            controller: _.startDateController,
                            w: 380.w,
                            label: _.startDate == null
                                ? 'startTime'.tr
                                : DateFormat('y-MM-d').format(_.startDate!),
                            color: const Color(0xfff8f7fb),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 50.h,
                  color: const Color(0xfff7f7f7),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        'reciver'.tr,
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            'anotherPerson'.tr,
                            style: TextStyle(
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          GetBuilder<CreateOrderController>(
                            builder: (_) => CupertinoSwitch(
                              value: _.anotherReceiver,
                              onChanged: (value) {
                                _.toggleReceiver();
                              },
                              activeColor:
                                  Theme.of(context).secondaryHeaderColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                GetBuilder<CreateOrderController>(
                  builder:(_)=>
                      _.anotherReceiver?
                      Column(children: [
                    Center(
                      child: GlobalTextForm(
                        controller: createOrder.reciverController,
                        label: 'reciverName',
                        color: const Color(0xfff8f7fb),
                        w: 380.w,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Center(
                      child: GlobalTextForm(
                        controller: createOrder.reciverPhoneController,
                        label: 'reciverPhone',
                        color: const Color(0xfff8f7fb),
                        w: 380.w,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),    Center(
                      child: GlobalTextForm(
                        controller: createOrder.reciverPhoneController,
                        label: 'reciverPhone2',
                        color: const Color(0xfff8f7fb),
                        w: 380.w,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],):SizedBox()
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: TextFormField(
                    controller: createOrder.detailsController,
                    textInputAction: TextInputAction.done,
                    enabled: true,
                    maxLines: 4,
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
                        borderSide: BorderSide(
                          color: Colors.grey[400]!,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GradientButton(
                  'confirmOrder'.tr,
                  () async {
                    Get.back();
                    await Future.delayed(
                      const Duration(milliseconds: 300),
                    );
                    Get.to(
                      () => const NewOrderMap(),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
