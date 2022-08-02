import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/Location_controller.dart';
import 'package:logistic/ui/screens/orders/pick_location.dart';
import 'package:logistic/ui/widgets/order/dotted_divider.dart';

class FromTo extends StatelessWidget {
  final bool withDriverDetails;

  const FromTo({Key? key, required this.withDriverDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      builder: (controller) => Container(
        padding: EdgeInsets.all(
          18.h,
        ),
        // height: withDriverDetails ? 215.h : 150.h,
        width: 382.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Get.find<LocationController>()
                            .searchLocation(context, isStartLocation: true);
                      },
                      child: const StartLocationWidget()),
                  !controller.startLocationPicked
                      ? SizedBox(
                          height: 30.h,
                        )
                      : Container(
                          margin: EdgeInsets.only(right: 15.w),
                          child: DottedDivider(length: 5)),
                  !controller.startLocationPicked
                      ? const SizedBox()
                      : !controller.startLocationPicked
                          ? SizedBox(
                              height: 0.h,
                            )
                          : InkWell(
                              onTap: () {
                                Get.find<LocationController>().searchLocation(
                                    context,
                                    isStartLocation: false);
                              },
                              child: const EndLocationWidget())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StartLocationWidget extends StatelessWidget {
  const StartLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(36),
            border: Border.all(
              width: 1.w,
              color: Colors.grey[400]!,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 13,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              radius: 10.w,
              child: CircleAvatar(
                radius: 4.w,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        GetBuilder<LocationController>(
          builder: (controller) => Expanded(
              child: AutoSizeText(
            controller.startLocationPicked
                ? controller.startLocationName
                : 'pick'.tr + '  ' + 'startPoint'.tr,
            style: TextStyle(
                fontSize: 12.sp,
                color: controller.startLocationPicked
                    ? Colors.black
                    : Colors.grey[600]),
          )),
        ),
      ],
    );
  }
}

class EndLocationWidget extends StatelessWidget {
  const EndLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
                backgroundColor: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        GetBuilder<LocationController>(
          builder: (controller) => Expanded(
              child: AutoSizeText(
            controller.endLocationPicked
                ? controller.endLocationName
                : 'pick'.tr + '  ' + 'endPoint'.tr,
            style: TextStyle(
                fontSize: 12.sp,
                color: controller.endLocationPicked
                    ? Colors.black
                    : Colors.grey[600]),
          )),
        ),
      ],
    );
  }
}
