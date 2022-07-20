import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/auth_controller.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/order/dotted_divider.dart';
import 'package:logistic/ui/widgets/request_card_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class OrderRequestDetails extends StatefulWidget {
  const OrderRequestDetails({Key? key}) : super(key: key);

  @override
  State<OrderRequestDetails> createState() => _OrderRequestDetailsState();
}

class _OrderRequestDetailsState extends State<OrderRequestDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFBFBFB),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color(0xffFBFBFB),
          leading: const PopButton(),
          centerTitle: true,
          title: AutoSizeText(
            'الطلب #123'.tr,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              //request card
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23.w, vertical: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
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
                          child:
                              Image.asset('assets/images/car_placeholder.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                  ],
                ),
              ),

              //from - to (circles with dividers)
              Column(
                children: [
                  DottedDivider(
                    length: 10,
                  ),
                  //starting point widget
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'completeInfo'.tr,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
                      ),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'completeInfo'.tr,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            'completeInfo'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  DottedDivider(
                    length: 10,
                  ),

                  //arrival point widget
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'completeInfo'.tr,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'completeInfo'.tr,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            'completeInfo'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  DottedDivider(
                    length: 10,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Center(
                    child: AutoSizeText(
                      'حمولة جزئية'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Center(
                    child: AutoSizeText(
                      'سيتم تحميل حمولتك مع حمولة اخرى'.tr,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),

                  AutoSizeText(
                    'السعر'.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  AutoSizeText(
                    '1,400 رس'.tr,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              //accept button
              Container(
                height: 80.h,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xff387D7E), Color(0xff27595A)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      'acceptOrder'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                    AutoSizeText(
                      '1300 رس'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
