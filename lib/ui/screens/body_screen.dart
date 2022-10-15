import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healMe/ui/screens/question_screen.dart';
import 'package:healMe/ui/widgets/commonButton.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({Key? key}) : super(key: key);

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  bool picked = false;

  pickPart() {
    picked = !picked;
    setState(() {});

    // Get.to(()=>QuestionScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F2F3),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text('What do you want to consult ?',
                    style: TextStyle(fontSize: 18))),
            Center(
                child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/body.png',
                    height: 700.h,
                  ),
                ),

                ///neck
                Positioned(
                  top: 120.h,
                  left: 10,
                  right: 10,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Theme.of(context).primaryColor)),
                  ),
                ),

                ///heart
                Positioned(
                  top: 200.h,
                  left: 10,
                  right: 40,
                  child: InkWell(
                    onTap: () {
                      pickPart();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color:  picked
                              ? Theme.of(context)
                              .secondaryHeaderColor
                              .withOpacity(0.6)
                              : Colors.white.withOpacity(0.6),
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                ),

                ///leg
                Positioned(
                  top: 580.h,
                  left: 60.w,
                  right: 10,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Theme.of(context).primaryColor)),
                  ),
                ),
              ],
            )),
            GradientButton(
              'Continue',
              () {
                Get.to(() => QuestionScreen());
              },
              isDisabled: !picked,
            ),
          ],
        ),
      ),
    );
  }
}
