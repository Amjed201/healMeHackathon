import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/ui/widgets/commn_icon_button.dart';

class SuspendedAccount extends StatelessWidget {
  const SuspendedAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 340.w,
          height: 340.h,
          padding: EdgeInsets.all(18.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.close,
                      color: Colors.grey[700],
                      size: 25.sp,
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.5,
                      color: const Color(0xfff64343),
                    ),
                    borderRadius: BorderRadius.circular(360),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      color: Color(0xfff64343),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              AutoSizeText(
                'suspended_account'.tr,
              ),
              Container(
                width: 200.w,
                height: 1,
                color: Colors.grey,
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),
              AutoSizeText(
                'suspended_account_reason'.tr,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 9,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              GradientIconButton(
                'contact_support'.tr,
                () {},
                Icons.phone,
                75.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
