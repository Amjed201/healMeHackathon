import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/authController.dart';
import 'package:logistic/ui/widgets/back.dart';

import '../widgets/request_card_widget.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFBFBFB),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Color(0xffFBFBFB),
          leading: PopButton(),
          centerTitle: true,
          title: AutoSizeText(
            'offers'.tr,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AutoSizeText(
                'cancel'.tr,
                style: TextStyle(
                  color: Colors.red[400],
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => const RequestCard(),
          ),
        ));
  }
}
