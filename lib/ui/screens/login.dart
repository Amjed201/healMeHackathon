import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: ListView(
        children: [
          Lottie.asset('assets/lottie/box.json',
              fit: BoxFit.fitWidth,
              width: 428.w, height: 500.h, repeat: false),
          SizedBox(height: 70.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'login'.tr,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
                AutoSizeText(
                  'phone'.tr,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  controller: _phoneController,
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  validator: (value) {
                    if (!GetUtils.isPhoneNumber(value!))
                      return 'Please enter a valid phone';
                    else if (value.length != 10) return 'Short Phone Number';
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'phone'.tr,
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
                SizedBox(
                  height: 30.h,
                ),
                GradientButton('confirm')
              ],
            ),
          )
        ],
      )),
    );
  }
}
