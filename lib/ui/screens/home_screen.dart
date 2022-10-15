import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healMe/controllers/appointment_controller.dart';
import 'package:healMe/services/helpers.dart';
import 'package:get/get.dart';
import 'package:healMe/services/localStorage.dart';
import 'package:healMe/ui/screens/add_appointment.dart';
import 'package:healMe/ui/screens/all_appointments.dart';
import 'package:healMe/ui/screens/body_screen.dart';
import 'package:healMe/ui/widgets/global/loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<AppointmentController>().getAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   onPressed: () {
      //     launchPhone('911');
      //   },
      //   child: Icon(
      //     FontAwesomeIcons.ambulance,
      //     color: Colors.white,
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).secondaryHeaderColor,
                      ])),
                  height: 300.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 60.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                )),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Hi,\n'
                              '${Get.find<LocalStorage>().getUser()?.name}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                          margin: EdgeInsets.only(bottom: 60.h),
                          child: Image.asset(
                            'assets/images/shape.png',
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 240.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => BodyScreen());
                        },
                        child: Container(
                          width: 170.w,
                          height: 180.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60.h,
                                child: Image.asset(
                                  'assets/images/telemedicine.png',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Take\n A Quick Test',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  height: 1.2,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => AddAppointment());
                        },
                        child: Container(
                          width: 170.w,
                          height: 180.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60.h,
                                child: Image.asset(
                                  'assets/images/ssss.png',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Doctor\'s \n Appoinment',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  height: 1.2,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset('assets/images/monitor.png'),
                    )),
                SizedBox(
                  width: 20.w,
                ),
                SizedBox(
                    height: 80.h,
                    child: VerticalDivider(
                      thickness: 1.5,
                    )),
                SizedBox(
                  width: 20.w,
                ),
                InkWell(
                    onTap: () {
                      launchPhone('911');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffFDF3F3),
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xffD02C2C))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/ambulance-lights-2.png',
                          height: 38.h,
                        ),
                      ),
                    )
                    // CircleAvatar(
                    //     radius: 28,
                    //     backgroundColor: Color(0xffFDF3F3),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(12.0),
                    //       child:
                    //           Image.asset('assets/images/ambulance-lights-2.png'),
                    //     )),
                    ),
                SizedBox(
                  width: 20.w,
                ),
                SizedBox(
                    height: 80.h,
                    child: VerticalDivider(
                      thickness: 1.5,
                    )),
                SizedBox(
                  width: 20.w,
                ),
                CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset('assets/images/drugs.png'),
                    )),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reservation History',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff083243),
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => AllAppointments());
                    },
                    child: Text(
                      'See All',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GetBuilder<AppointmentController>(builder: (controller) {
              return controller.loading
                  ? LoadingWidget()
                  : controller.appointments.length == 0
                      ? Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Center(
                            child: Text(
                              'No previous appoinments',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Container(
                            width: 360.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 20.w, top: 20.h),
                                  child: Text(
                                    // controller.appointments.first.timeslot?.str??'',
                                    'Monday, \n'
                                    'January 1st \n'
                                    '10:00 AM',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  height: 40.h,
                                  width: double.infinity,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  child: Center(
                                      child: Text(
                                    'Upcoming',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  )),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            child: Text('Dr.Wael Hassan',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16))),
                                        Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            child: Text(
                                                controller.appointments.first
                                                        .category?.name ??
                                                    '',
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12))),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                      ],
                                    ),
                                    Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
            }),
          ],
        ),
      ),
    );
  }
}
