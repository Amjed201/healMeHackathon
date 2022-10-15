import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healMe/ui/screens/auth/login.dart';
import 'package:healMe/ui/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateHome();
  }

  navigateHome() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAll(() => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Image.asset('assets/images/Logo.png')));
  }
}
