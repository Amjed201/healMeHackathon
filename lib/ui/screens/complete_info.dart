import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/authController.dart';
import 'package:logistic/controllers/create_order_controller.dart';
import 'package:logistic/ui/screens/new_order_map.dart';
import 'package:logistic/ui/screens/tabs_screen.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/text_field.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class InfoScreen extends StatefulWidget {
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 250.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'completeInfo'.tr,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 22.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AutoSizeText(
                        'name'.tr,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: MyTextField(
                    controller: _phoneController,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: AutoSizeText(
                    'email'.tr,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: MyTextField(
                    controller: _emailController,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                GradientButton('save'.tr, () => Get.to(() => TabsScreen())),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: RichText(
                    maxLines: 1,
                    text: TextSpan(
                        text: 'agreeTerms'.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: (Get.locale?.languageCode == 'en'
                              ? 'PlusJakartaSans'
                              : 'Montserrat-Arabic'),
                          color: Colors.black45,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'serviceTerms'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: (Get.locale?.languageCode == 'en'
                                    ? 'PlusJakartaSans'
                                    : 'Montserrat-Arabic'),
                                color: Theme.of(context).primaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Get.to(() => const Privacy());
                                })
                        ]),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
