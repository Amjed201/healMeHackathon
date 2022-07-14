import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/authController.dart';
import 'package:logistic/ui/screens/tabs_screen.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/text_field.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: AutoSizeText(
          'editProf'.tr,
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Stack(children: [
                  CircleAvatar(
                    radius: 41.sp,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 61.sp,
                    ),
                  ),  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),

                ],),
              ),

              SizedBox(
                height: 30.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Center(
                child: SizedBox(
                width: 380.w,
                  height: 69.h,
                  child: TextFormField(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => FocusManager.instance.primaryFocus?.unfocus(),
                    validator: (value) {
                      if (!GetUtils.isPhoneNumber(value!)) {
                        return 'Please enter ' + 'name'.tr;
                      } else if (value.length < 2) {
                        return 'Short' + 'name'.tr;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'name'.tr,
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                    ),
                  ),
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
                          onEditingComplete: () => FocusManager.instance.primaryFocus?.unfocus(),
                          validator: (value) {
                            if (!GetUtils.isPhoneNumber(value!)) {
                              return 'Please enter ' + 'phone'.tr;
                            } else if (value.length != 10) {
                              return 'Short' + 'phone'.tr;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'phone'.tr,
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50.h,
            child: GradientButton(
              'save'.tr,
              () => Get.to(
                () => TabsScreen(),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
