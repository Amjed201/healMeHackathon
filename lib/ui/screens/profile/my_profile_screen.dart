import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/auth_controller.dart';
import 'package:logistic/services/localStorage.dart';
import 'package:logistic/ui/screens/profile/contact_us_screen.dart';
import 'package:logistic/ui/screens/profile/edit_profile_screen.dart';
import 'package:logistic/ui/screens/profile/manage_contacts_screen.dart';

import '../../widgets/my_account_button.dart';

class MyProfile extends StatelessWidget {
  MyProfile({Key? key}) : super(key: key);

  final user = Get.find<LocalStorage>().getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: AutoSizeText(
          'settings'.tr,
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => Get.find<AuthController>().logout(),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: AutoSizeText(
                  'logout'.tr,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 30.h,
            ),
            CircleAvatar(
              radius: 41.sp,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 61.sp,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Center(
              child: AutoSizeText(
                user?.fullName ?? '',
                style: TextStyle(
                  fontSize: 17.sp,
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Center(
              child: AutoSizeText(
                user?.phoneNumber ?? '',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            MyAccountButton(
              icon: Icons.person,
              label: "editProf".tr,
              onTap: () {
                Get.to(() => EditProfile());
              },
            ),
            const Divider(),
            MyAccountButton(
              icon: Icons.document_scanner_outlined,
              label: "manegeContact".tr,
              onTap: () {
                Get.to(() => ManageContacts());
              },
            ),
            const Divider(),
            MyAccountButton(
              icon: Icons.check,
              label: "terms".tr,
            ),
            const Divider(),
            MyAccountButton(
              onTap: () => Get.to(() => const ContactUsScreen()),
              icon: Icons.contact_support_outlined,
              label: "contactUs".tr,
            ),
          ],
        ),
      ),
    );
  }
}
