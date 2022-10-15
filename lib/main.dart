import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:healMe/services/helpers.dart';
import 'package:healMe/services/translation.dart';
import 'package:healMe/ui/screens/auth/login.dart';
import 'package:healMe/ui/screens/auth/register.dart';
import 'package:healMe/ui/screens/home_screen.dart';
import 'package:healMe/ui/screens/result_screen.dart';
import 'package:healMe/ui/screens/splash_screen.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initControllers();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, widget) => GetMaterialApp(
        locale:
            // Get.find<LocalStorage>().getLang() == 'en'
            //     ? Locale('en', 'EN')
            //     :
            Locale('en', 'EN'),
        translations: LocaleString(),
        debugShowCheckedModeBanner: false,
        title: 'Heal Me',
        theme: ThemeData(
          primaryColor: const Color(0xff1B9CED) ,
          secondaryHeaderColor: const Color(0xff2BDABA),
          // focus color for texts
          hintColor: Color(0xff444A60),
          focusColor: Colors.black,
          fontFamily:
              // Get.locale?.languageCode == 'en'
              //     ? 'PlusJakartaSans'
              //     :
              'Poppins',
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(
            secondary: const Color(0xffa49e9e),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
