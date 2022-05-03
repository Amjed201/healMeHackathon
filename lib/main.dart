import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:logistic/services/helpers.dart';
import 'package:get/get.dart';
import 'package:logistic/services/localStorage.dart';
import 'package:logistic/services/translation.dart';
import 'package:logistic/ui/screens/login.dart';
import 'package:logistic/ui/screens/splash.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initControllers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (_) => GetMaterialApp(
              locale: Get.find<LocalStorage>().getLang() == 'en'
                  ? Locale('en', 'EN')
                  : Locale('ar', 'AR'),
              translations: LocaleString(),
              debugShowCheckedModeBanner: false,
              title: 'Logistic',
              theme: ThemeData(
                  primaryColor: const Color(0xff387E7E),
                  secondaryHeaderColor: const Color(0xffFAA933),
                  // focus color for texts
                  hintColor: Color(0xff454B60),
                  focusColor: Colors.black,
                  fontFamily: Get.locale?.languageCode == 'en'
                      ? 'PlusJakartaSans'
                      : 'Montserrat-Arabic',
                  colorScheme:
                      ColorScheme.fromSwatch(primarySwatch: Colors.orange)
                          .copyWith(secondary: const Color(0xffa49e9e))),
              home: LoginScreen(),
            ));
  }
}
