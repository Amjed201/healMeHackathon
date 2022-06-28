import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FromTo extends StatelessWidget {
  final bool withDriverDetails;
  const FromTo({Key? key, required this.withDriverDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 18.h,
        bottom: withDriverDetails ? 0 : 18.h,
      ),
      height: withDriverDetails ? 215.h : 150.h,
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(360),
                        border: Border.all(
                          width: 1.w,
                          color: Colors.grey[400]!,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 13,
                        child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).secondaryHeaderColor,
                          radius: 10.w,
                          child: CircleAvatar(
                            radius: 4.w,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 5.h,
                      width: 2.w,
                      color: Colors.grey[400],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 5.h,
                      width: 2.w,
                      color: Colors.grey[400],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 5.h,
                      width: 2.w,
                      color: Colors.grey[400],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      height: 5.h,
                      width: 2.w,
                      color: Colors.grey[400],
                    ),
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
                            backgroundColor:
                                Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  children: [
                    Text(
                      "completeInfo".tr,
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      "completeInfo".tr,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      "completeInfo".tr,
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      "completeInfo".tr,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: withDriverDetails ? 19.h : 0,
          ),
          !withDriverDetails
              ? const SizedBox()
              : Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              radius: (43 / 2).h,
                              child: Icon(
                                Icons.person,
                                size: 30.h,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'completeInfo'.tr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  'completeInfo'.tr,
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          'completeInfo'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}