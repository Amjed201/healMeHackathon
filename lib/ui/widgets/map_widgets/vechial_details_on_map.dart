import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/create_order_controller.dart';

class VechialDetailsOnMap extends StatelessWidget {
   VechialDetailsOnMap({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 163.h,
      width: 380.w,
      padding: EdgeInsets.symmetric(
        horizontal: 21.w,
        vertical: 11.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          GetBuilder<CreateOrderController>(
            builder:(controller)=> DropdownButton(
              items: controller.vehicles,
              onChanged: (String? value) {
                 controller.selectedVehicle = value??'';
              },
              value: controller.selectedVehicle,
              isExpanded: true,
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'completeInfo'.tr,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
              Text(
                'completeInfo'.tr,
                style: TextStyle(
                  fontSize: 25.sp,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
