import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/data/models/bid.dart';

class RequestCard extends StatelessWidget {
  Bid bid;

   RequestCard(this.bid,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 23.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      height: 187.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
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
                            bid.driverUser?.fullName??'Full Name',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          AutoSizeText(
                            '${bid.driverUser?.driver?.ratingCount??0}',
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
                        '${bid.driverUser?.driver?.vehicleType?.vehicleNameAr}',
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
                  '${bid.price} SR',
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
