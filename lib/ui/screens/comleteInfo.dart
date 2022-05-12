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
import 'package:logistic/ui/screens/home.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class InfoScreen extends StatefulWidget {
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _phoneNode = FocusNode();

  var _phoneController = TextEditingController();

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
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: SizedBox(
                    width: 380.w,
                    height: 69.h,
                    child: TextFormField(
                      controller: _phoneController,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      validator: (value) {
                        if (!GetUtils.isPhoneNumber(value!))
                          return 'Please enter a valid phone';
                        else if (value.length != 10)
                          return 'Short Phone Number';
                      },
                      keyboardType: TextInputType.text,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        // hintText: 'phone'.tr,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Colors.black26,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                GradientButton('save'.tr, () => Get.to(() => Home())),
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
