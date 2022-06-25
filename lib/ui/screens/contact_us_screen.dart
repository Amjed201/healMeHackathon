import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/ui/widgets/back.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const PopButton(),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "customerService".tr,
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 4.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                AutoSizeText(
                  'online'.tr,
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 710.h,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  width: 346.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey[300]!,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    cursorColor: Colors.black,
                    cursorWidth: 1.w,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "writeMessage".tr,
                        hintStyle: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                        suffixIcon: const Icon(
                          Icons.attach_file,
                          color: Colors.grey,
                        )),
                  ),
                ),
                SizedBox(
                  width: 22.1.w,
                ),
                Icon(
                  Icons.send,
                  color: Theme.of(context).primaryColor,
                  size: 21.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
