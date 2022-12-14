// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:healMe/controllers/auth_controller.dart';
// import 'package:healMe/ui/screens/auth/complete_info.dart';
// import 'package:healMe/ui/widgets/back.dart';
// import 'package:healMe/ui/widgets/commonButton.dart';
// import 'package:healMe/ui/widgets/global/loading.dart';
// import 'package:pin_code_text_field/pin_code_text_field.dart';
//
// class OtpScreen extends StatefulWidget {
//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   final _otpNode = FocusNode();
//
//   var _otpController = TextEditingController();
//
//   final auth = Get.find<AuthController>();
//
//   void confirmOtp() async {
//     String? fcmToken = await FirebaseMessaging.instance.getToken();
//     print('####FCM TOKEN : ' '$fcmToken');
//     if (_otpController.text.length == 5) {
//       auth.checkOtp(
//           phone: auth.phone,
//           countryCode: '+249',
//           otp: _otpController.text,
//           fcmToken: fcmToken ?? '');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: PopButton(),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 30.h),
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 250.h,
//             ),
//             AutoSizeText(
//               'mobileConfirm'.tr,
//               style: TextStyle(
//                 color: Theme.of(context).primaryColor,
//                 fontSize: 22.sp,
//               ),
//             ),
//             SizedBox(
//               height: 15.h,
//             ),
//             AutoSizeText(
//               'enterCode'.tr + Get.find<AuthController>().phone,
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 color: Theme.of(context).hintColor,
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Center(
//               child: PinCodeTextField(
//                 autofocus: false,
//                 controller: _otpController,
//                 hideCharacter: false,
//                 highlight: true,
//                 highlightColor: Theme.of(context).primaryColor,
//                 defaultBorderColor: Colors.grey[400]!,
//                 hasTextBorderColor: Theme.of(context).secondaryHeaderColor,
//                 maxLength: 5,
//                 hasError: false,
//                 // maskCharacter: "????",
//                 onTextChanged: (text) {
//                   setState(() {});
//                 },
//                 onDone: (text) {
//                   print("DONE $text");
//                   print("DONE CONTROLLER ${_otpController.text}");
//                 },
//                 wrapAlignment: WrapAlignment.spaceAround,
//                 pinBoxDecoration:
//                     ProvidedPinBoxDecoration.defaultPinBoxDecoration,
//                 pinBoxRadius: 15,
//                 pinBoxHeight: 86.h,
//                 pinBoxWidth: 56.w,
//                 pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                 pinTextStyle: TextStyle(
//                     fontSize: 30.sp, color: Theme.of(context).hintColor),
//                 pinTextAnimatedSwitcherTransition:
//                     ProvidedPinBoxTextAnimation.scalingTransition,
//                 //pinBoxColor: Colors.green[100],
//                 pinTextAnimatedSwitcherDuration:
//                     const Duration(milliseconds: 300),
//                 //highlightAnimation: true,
//                 highlightAnimationBeginColor: Colors.black,
//                 highlightAnimationEndColor: Colors.white12,
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//             SizedBox(
//               height: 19.h,
//             ),
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AutoSizeText(
//                     'resend'.tr,
//                     style: TextStyle(
//                         fontSize: 14.sp,
//                         color: Theme.of(context).hintColor,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       // Get.find<AuthController>()
//                       //     .sendOtp(phone: auth.phone, context: context);
//                     },
//                     child: AutoSizeText(
//                       '60:00'.tr,
//                       style: TextStyle(
//                           fontSize: 14.sp,
//                           color: Theme.of(context).secondaryHeaderColor,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 55.h,
//             ),
//             GetBuilder<AuthController>(
//                 builder: (controller) => controller.loading
//                     ? const Center(child: LoadingWidget())
//                     : GradientButton(
//                         'confirmVerify'.tr,
//                         () => confirmOtp(),
//                       ))
//           ],
//         ),
//       ),
//     );
//   }
// }
