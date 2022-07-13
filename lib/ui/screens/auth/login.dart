import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:logistic/ui/screens/auth/otp.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          children: [
            //check if keyboard is opened or not
            // if condition is true => keyboard is closed
            MediaQuery.of(context).viewInsets.bottom == 0
                ?
                //shape
                Column(
                    children: [
                      Lottie.asset(
                        'assets/lottie/box.json',
                        fit: BoxFit.fill,
                        width: 428.w,
                        height: 580.h,
                        repeat: false,
                      ),
                      Divider(
                        height: 10,
                        color: Theme.of(context).secondaryHeaderColor,
                        thickness: 10,
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            PopButton(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 170.h,
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: 20.h,
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
                          'login'.tr,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 22.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AutoSizeText(
                          'phone'.tr,
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
                    child: SizedBox(
                      width: 380.w,
                      height: 69.h,
                      child: TextFormField(
                        controller: _phoneController,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        validator: (value) {
                          if (!GetUtils.isPhoneNumber(value!)) {
                            return 'Please enter a valid phone';
                          } else if (value.length != 10) {
                            return 'Short Phone Number';
                          } else {
                            return "Please enter a valid phone";
                          }
                        },
                        keyboardType: TextInputType.number,
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
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GradientButton(
                    'login'.tr,
                    () => Get.to(
                      () => OtpScreen(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
