import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/contacts_controller.dart';
import 'package:logistic/controllers/create_order_controller.dart';
import 'package:logistic/controllers/zone_controller.dart';
import 'package:logistic/data/models/user.dart';
import 'package:logistic/services/localStorage.dart';
import 'package:logistic/ui/screens/auth/complete_info.dart';
import 'package:logistic/ui/screens/auth/login.dart';
import 'package:logistic/ui/screens/tabs_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUser();

    Get.find<CreateOrderController>().getZonesAndVehicles();
    Get.find<ContactsController>().getContacts();
  }

  checkUser() async {
    String? token = Get.find<LocalStorage>().getToken();
    User? user = Get.find<LocalStorage>().getUser();
    await Future.delayed(const Duration(seconds: 2));
    if (token != null) {
      //check whether the user have registered or not
      Get.offAll(() => user?.fullName == null ? InfoScreen() : TabsScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Icon(
          Icons.local_airport,
          size: 50,
          color: Theme.of(context).primaryColor,
        )));
  }
}
