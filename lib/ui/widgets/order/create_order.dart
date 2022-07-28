import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logistic/controllers/contacts_controller.dart';
import 'package:logistic/data/models/city.dart';
import 'package:logistic/data/models/contact.dart';
import 'package:logistic/data/models/region.dart';
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
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CreateOrderController>(
          builder: (controller) => Container(
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: DropdownButtonFormField<Region>(
                      onTap: () {
                        controller.selectedCity1 = null;
                      },
                      items: controller.regions,
                      value: controller.selectedRegion1 != null
                          ? controller.selectedRegion1
                          : null,
                      hint: Text(
                        "chooseRegion".tr,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (Region? newValue) {
                        controller.selectedRegion1 = newValue;
                        if (controller.autoPickRegion) {
                          controller.selectedRegion2 = newValue;
                        }
                        controller.updateZonesList();
                      },
                      decoration: InputDecoration(
                        fillColor: const Color(0xfff8f7fb),
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xffd5e1e8),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: DropdownButtonFormField<City>(
                      items:
                          controller.cities1 == null || controller.cities1 == []
                              ? []
                              : controller.cities1,
                      value: controller.selectedCity1 == null
                          ? null
                          : controller.selectedCity1,
                      hint: Text(
                        "chooseCity".tr,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (City? newValue) {
                        controller.selectedCity1 = newValue;
                        if (controller.autoPickCity) {
                          controller.selectedCity2 = newValue;
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: const Color(0xfff8f7fb),
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xffd5e1e8),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: DropdownButtonFormField<Region>(
                      onTap: () {
                        print('pressssssssssssssssed');
                        controller.selectedCity2 = null;
                      },
                      items: controller.regions,
                      value: controller.selectedRegion2 != null
                          ? controller.selectedRegion2
                          : null,
                      hint: Text(
                        "chooseRegion".tr,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (Region? newValue) {
                        controller.selectedRegion2 = newValue;
                        controller.updateZonesList();
                      },
                      decoration: InputDecoration(
                        fillColor: const Color(0xfff8f7fb),
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xffd5e1e8),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: DropdownButtonFormField<City>(
                      items: controller.cities2 == [] ? [] : controller.cities2,
                      value: controller.selectedCity2 == null
                          ? null
                          : controller.selectedCity2,
                      hint: Text(
                        "chooseCity".tr,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (City? newValue) {
                        controller.selectedCity2 = newValue;
                      },
                      decoration: InputDecoration(
                        fillColor: const Color(0xfff8f7fb),
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xffd5e1e8),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
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
                    list: controller.paymentMethods,
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
                            controller.pickDateAndTime(context);
                          },
                          child: GlobalTextForm(
                            isEnabled: false,
                            controller: controller.startDateController,
                            w: 380.w,
                            label: controller.startDate == null ||
                                    controller.startTime == null
                                ? 'startTime'.tr
                                : DateFormat('y-MM-d')
                                        .format(controller.startDate!) +
                                    '    '
                                        '${controller.startTime!.hour} : ' +
                                    '${controller.startTime!.minute}',
                            color: const Color(0xfff8f7fb),
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
                            CupertinoSwitch(
                              value: controller.anotherReceiver,
                              onChanged: (value) {
                                controller.toggleReceiver();
                              },
                              activeColor:
                                  Theme.of(context).secondaryHeaderColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  controller.anotherReceiver
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: GlobalTextForm(
                                    isEnabled: true,
                                    controller: controller.reciverController,
                                    label: 'reciverName',
                                    color: const Color(0xfff8f7fb),
                                    w: 300.w,
                                  ),
                                ),
                                DropdownButton(
                                  items: Get.find<ContactsController>()
                                      .contactsMenu,
                                  onChanged: (Contact? contact) {
                                    Contact? selectedContact =
                                        Get.find<ContactsController>()
                                            .selectedContact;
                                    selectedContact = contact;
                                    controller.reciverController.text =
                                        selectedContact?.name ?? '';
                                    controller.reciverPhoneController.text =
                                        selectedContact?.primaryPhone ?? '';
                                    controller.reciverPhoneController2.text =
                                        selectedContact?.secondaryPhone ?? '';
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Center(
                              child: GlobalTextForm(
                                isEnabled: true,
                                controller: controller.reciverPhoneController,
                                label: 'reciverPhone',
                                color: const Color(0xfff8f7fb),
                                w: 380.w,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Center(
                              child: GlobalTextForm(
                                isEnabled: true,
                                controller: controller.reciverPhoneController,
                                label: 'reciverPhone2',
                                color: const Color(0xfff8f7fb),
                                w: 380.w,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        )
                      : SizedBox(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: TextFormField(
                      controller: controller.detailsController,
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
                      // Get.back();
                      Get.to(
                        () => const NewOrderMap(),
                      );
                      await Future.delayed(
                        const Duration(milliseconds: 500),
                      );
                      controller.calculateVehiclePrice(
                          vehicleId: 2, distance: '100');
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
      ),
    );
  }
}
