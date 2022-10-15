import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:healMe/controllers/auth_controller.dart';
import 'package:healMe/services/helpers.dart';
import 'package:healMe/ui/screens/auth/otp.dart';
import 'package:healMe/ui/screens/auth/register.dart';
import 'package:healMe/ui/widgets/back.dart';
import 'package:healMe/ui/widgets/commonButton.dart';
import 'package:healMe/ui/widgets/global/loading.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() {
    final authController = Get.find<AuthController>();

    if (_emailController.text == '') {
      showToast('Enter your email');
    } else if (_passwordController.text == '') {
      showToast('Enter your password');
    } else
      authController.login(
          email: _emailController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).secondaryHeaderColor,
                  ])),
              height: 320.h,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Image.asset(
                        'assets/images/shape.png',
                      )
                    ],
                  ),
                  Image.asset(
                    'assets/images/Logo-w.png',
                  ),
                  SizedBox(height: 20.h,)
                ],
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(30.0),
            //   child: Image.asset(
            //     'assets/images/Logo.png',
            //     width: 200.w,
            //     height: 200.h,
            //   ),
            // ),
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
                            color: Color(0xff083243),
                            fontSize: 26.sp,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        AutoSizeText(
                          'email'.tr,
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
                  GetBuilder<AuthController>(builder: (authController) {
                    // _phoneController.text = authController.phone;
                    return Center(
                      child: SizedBox(
                        width: 380.w,
                        height: 69.h,
                        child: TextFormField(
                          controller: _emailController,
                          textInputAction: TextInputAction.done,
                          textDirection: TextDirection.ltr,
                          keyboardType: TextInputType.text,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            // hintText: 'phone'.tr,
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
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
                    );
                  }),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        AutoSizeText(
                          'Password'.tr,
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
                  GetBuilder<AuthController>(builder: (authController) {
                    // _phoneController.text = authController.phone;
                    return Center(
                      child: SizedBox(
                        width: 380.w,
                        height: 69.h,
                        child: TextFormField(
                          controller: _passwordController,
                          textInputAction: TextInputAction.done,
                          // onEditingComplete: () {
                          // authController.phone = _phoneController.text;
                          // sendOtp();
                          // },
                          // onChanged: (text) => authController.phone = text,
                          // onFieldSubmitted: (text) =>
                          //     authController.phone = text,
                          textDirection: TextDirection.ltr,
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            // hintText: 'phone'.tr,
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
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
                    );
                  }),
                  SizedBox(
                    height: 30.h,
                  ),
                  GetBuilder<AuthController>(
                      builder: (controller) => controller.loading
                          ? const Center(child: LoadingWidget())
                          : GradientButton('login'.tr, () => login())),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Dont have an account ?',
                        style: TextStyle(
                          color: Color(0xff083243),
                          fontSize: 14.sp,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => RegisterScreen());
                        },
                        child: AutoSizeText(
                          '   Register here',
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
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
