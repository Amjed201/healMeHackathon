import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VechialDetailsOnMap extends StatelessWidget {
  const VechialDetailsOnMap({Key? key}) : super(key: key);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 52.h,
                    width: 76.w,
                    child: Image.asset('assets/images/car_placeholder.png'),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
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
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.black,
              )
            ],
          ),
          Divider(
            height: 20.h,
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
                  fontSize: 30.sp,
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
