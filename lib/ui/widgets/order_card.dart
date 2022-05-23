import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.grey.shade50,
        elevation: 0.5,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            Container(
              margin:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.h,
                        backgroundColor:
                        Theme.of(context).secondaryHeaderColor,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        children: [
                          AutoSizeText(
                            'completeInfo'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          AutoSizeText(
                            'completeInfo'.tr,
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  ///fix vertical divider
                  SizedBox(
                    height: 30.h,
                  ),
                  //     child: VerticalDivider(color: Colors.black,thickness: 2,width: 2,indent: 1.h,endIndent: 30.h,)),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.h,
                        backgroundColor:
                        Theme.of(context).secondaryHeaderColor,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        children: [
                          AutoSizeText(
                            'completeInfo'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          AutoSizeText(
                            'completeInfo'.tr,
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: Theme.of(context).primaryColor),
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.h,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.person,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          children: [
                            AutoSizeText(
                              'completeInfo'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                            AutoSizeText(
                              'completeInfo'.tr,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          '11/05/2022',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
