import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:healMe/controllers/auth_controller.dart';
import 'package:healMe/services/helpers.dart';
import 'package:healMe/ui/screens/auth/login.dart';
import 'package:healMe/ui/screens/auth/otp.dart';
import 'package:healMe/ui/widgets/back.dart';
import 'package:healMe/ui/widgets/commonButton.dart';
import 'package:healMe/ui/widgets/global/loading.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _genderController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  List<String> selectedDiseaseList = [];

  void register() {
    final authController = Get.find<AuthController>();

    if(_nameController.text == ''){
      showToast('Enter your name');
    } else if(_emailController.text == ''){
      showToast('Enter your email');
    } else if(_phoneController.text == ''){
      showToast('Enter your phone');
    }else if(_passwordController.text == ''){
      showToast('Enter your password');
    }else if(_ageController.text == ''){
      showToast('Enter your Age');
    }else {
      authController.registerUser(
          name: _nameController.text,
          email: _emailController.text,
          phone: authController.phone,
          password: _passwordController.text,
          age: _ageController.text,
          diseases: selectedDiseaseList.first
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          children: [
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
                          'Registration'.tr,
                          style: TextStyle(
                            color: Color(0xff083243),
                            fontSize: 26.sp,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        AutoSizeText(
                          'Name'.tr,
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
                          controller: _nameController,
                          textInputAction: TextInputAction.done,
                          // onEditingComplete: () {
                          //
                          //
                          // },
                          // onChanged: (text) => authController.phone = text,
                          // onFieldSubmitted: (text) =>
                          // authController.phone = text,
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
                          'Email'.tr,
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
                          // onEditingComplete: () {
                            // authController.phone = _phoneController.text;
                            // sendOtp();
                          // },
                          // onChanged: (text) => authController.phone = text,
                          // onFieldSubmitted: (text) =>
                          //     authController.phone = text,
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
                          'Phone Number'.tr,
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
                          controller: _phoneController,
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
                          keyboardType: TextInputType.text,
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        AutoSizeText(
                          'Age'.tr,
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
                          controller: _ageController,
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
                          'Chronic Disease'.tr,
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
                  MultiSelectChip(
                    ['Covid', 'Flu', 'Heart disease'],
                    onSelectionChanged: (selectedList) {
                      setState(() {
                        selectedDiseaseList = selectedList;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GetBuilder<AuthController>(
                      builder: (controller) => controller.loading
                          ? const Center(child: LoadingWidget())
                          : GradientButton('Register'.tr, () => register())),

                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Already have an account ?',
                        style: TextStyle(
                          color: Color(0xff083243),
                          fontSize: 14.sp,
                        ),
                      ), InkWell(
                        onTap: (){
                          Get.to(()=>LoginScreen());
                        },
                        child: AutoSizeText(
                          '   Login',
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

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  MultiSelectChip(this.reportList, {required this.onSelectionChanged} // +added
      );

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = [];

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          selectedColor: Theme.of(context).secondaryHeaderColor,
          label: Text(
            item,
            style: TextStyle(color: Colors.white),
          ),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices); // +added
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
