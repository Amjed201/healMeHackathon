import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/authController.dart';
import 'package:logistic/ui/screens/complete_info.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class RequestScreen extends StatefulWidget {
  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFBFBFB),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Color(0xffFBFBFB),
          leading: PopButton(),
          centerTitle: true,
          title: AutoSizeText(
            'offers'.tr,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AutoSizeText(
                'cancel'.tr,
                style: TextStyle(
                  color: Colors.red[400],
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => const RequestCard(),
          ),
        ));
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 300.h,
        width: 428.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                AutoSizeText(
                  '600 ر.س'.tr,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
                AutoSizeText(
                  'توصيل خلال 40 دقيقة'.tr,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                InkWell(
                  onTap: () => null,
                  child: Center(
                    child: Container(
                      height: 69.h,
                      width: 240.w,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff387D7E),
                                const Color(0xff27595A)
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft)),
                      child: Center(
                          child: AutoSizeText(
                        'الموافقة على العرض'.tr,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                )
              ],
            ),
            SizedBox(width: 20.w,),
            Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Expanded(
                  child: Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.directions_car,
                              size: 80,
                            ),
                            AutoSizeText(
                              'ميني كاب'.tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 25.h,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
