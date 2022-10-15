import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healMe/controllers/quickTest_controller.dart';
import 'package:healMe/ui/screens/result_screen.dart';
import 'package:healMe/ui/widgets/commonButton.dart';
import 'package:healMe/ui/widgets/global/loading.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<QuickTestController>().getQuestions();
    Get.find<QuickTestController>().answers = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F2F3),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<QuickTestController>(builder: (controller) {
        return SafeArea(
          child: controller.loading
              ? const LoadingWidget()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Question ${count + 1}/${controller.questions.length}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff083243),
                                )),
                            (count + 1 ==
                                controller.questions.length) ?
                            Text(controller.questions[count],
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xff083243),
                                )):
                            AnimatedCrossFade(
                              crossFadeState: CrossFadeState.showFirst,
                              duration: const Duration(milliseconds: 500),
                              firstChild: Text(controller.questions[count],
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xff083243),
                                  )),
                              secondChild: Text(controller.questions[count + 1],
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xff083243),
                                ),),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.answers.add(1);

                                    if (count + 1 !=
                                        controller.questions.length) {
                                      count++;
                                    } else {
                                      controller.sendAnswers();
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.grey[300]!)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xff083243),
                                          ),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.answers.add(0);

                                    if (count + 1 !=
                                        controller.questions.length) {
                                      count++;
                                    } else {
                                      controller.sendAnswers();
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.grey[300]!)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xff083243),
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
        );
      }),
    );
  }
}
