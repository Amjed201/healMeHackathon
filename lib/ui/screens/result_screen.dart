import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healMe/controllers/quickTest_controller.dart';
import 'package:healMe/ui/screens/home_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Get.find<QuickTestController>().isCovid
            ? Column(
                children: [
                  SizedBox(
                    height: 200.h,
                  ),
                  Center(
                    child: Lottie.asset(
                      'assets/lottie/lf30_editor_wuujf9ac.json',
                      fit: BoxFit.fill,
                      height: 180.h,
                      repeat: false,
                    ),
                  ),
                  Text(
                    'You\'re Fine ',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  )
                ],
              )
            : Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 200.h,
                          ),
                          Icon(
                            Icons.warning_amber,
                            color: Color(0xffc83d58),
                          ),
                          Text(
                            'We diagnosed you with',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          Text(
                            'Covid-19',
                            style: TextStyle(
                              color: Color(0xffc83d58),
                              fontSize: 22,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        'Recommended Medication',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[500],
                          // fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  RecommendMedicine(),

                  SizedBox(height: 20.h,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        'Recommended Doctor',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[500],
                          // fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  RecommendDoctor(),

                ],
              ),
        Spacer(),
        InkWell(
          onTap: () {
            Get.offAll(() => HomeScreen());
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 30.h),
            child: Center(
              child: Text(
                'Back To Home',
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
            ),
          ),
        )
      ],
    )));
  }
}

class RecommendMedicine extends StatelessWidget {
  const RecommendMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/50.jpeg',
              height: 90.h,
              width: 150.h,
            ),

            SizedBox(width: 20.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dexamethasone',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff083243),
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on_outlined,color: Colors.grey[500],),
                    Text(
                      'Al-basmala Pharmacy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
class RecommendDoctor extends StatelessWidget {
  const RecommendDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/portrait_of_a_happy_young_doctor_in_his_clinic_royalty_free_image.jpeg',
              fit: BoxFit.fill,
              height: 90.h,
              width: 150.h,
            ),

            SizedBox(width: 20.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ahmed Osman',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff083243),
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on_outlined,color: Colors.grey[500],),
                    Text(
                      'Royal Care Hospital',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
