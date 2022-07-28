import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/create_order_controller.dart';
import 'package:logistic/data/models/vehicle.dart';

class VechialDetailsOnMap extends StatelessWidget {
  VechialDetailsOnMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateOrderController>(
      builder: (controller) => Container(
        // height: 163.h,
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
              builder: (controller) => DropdownButton<Vehicle>(
                items: controller.vehiclesDropdownList,
                onChanged: (Vehicle? value) {
                  controller.changeVehicle(value!);
                },
                value: controller.selectedVehicle,
                isExpanded: true,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text(
              'estPrice'.tr,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
              ),
            ),
            controller.loading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'calculatePrice'.tr,
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SpinKitThreeBounce(
                        color: Theme.of(context).primaryColor,
                        size: 25,
                      ),
                    ],
                  )
                : Text(
                    '${controller.price} رس ',
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
