import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 23.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      height: 187.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.h,
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.person,
                      size: 30.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AutoSizeText(
                            "User name",
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          AutoSizeText(
                            "4.5",
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: 15.sp,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                      AutoSizeText(
                        "Vechile type",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 83.h,
                width: 104.w,
                child: Image.asset('assets/images/car_placeholder.png'),
              ),
            ],
          ),
          SizedBox(
            height: 19.h,
          ),
          Container(
            height: 49.h,
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  'acceptOrder'.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.sp,
                  ),
                ),
                AutoSizeText(
                  '1300 رس'.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}