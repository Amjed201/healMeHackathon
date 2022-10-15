import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healMe/controllers/appointment_controller.dart';
import 'package:healMe/ui/widgets/global/loading.dart';

class AllAppointments extends StatefulWidget {
  const AllAppointments({Key? key}) : super(key: key);

  @override
  State<AllAppointments> createState() => _AllAppointmentsState();
}

class _AllAppointmentsState extends State<AllAppointments> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<AppointmentController>().getAppointments();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Appoinments'), centerTitle: true, elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child:

        GetBuilder<AppointmentController>(builder: (controller) {
          return
            controller.loading?
                LoadingWidget():
            ListView.builder(
              itemCount: controller
                  .appointments
                  .length,
              itemBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                            offset: Offset(0, 3), // changes position of shadow
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
                              'Monday, \n'
                                  'January 1st \n'
                                  '${controller
                                  .appointments[index].timeslot?.str}',
                              style: TextStyle(fontSize: 18,),
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Container(
                            height: 40.h,
                            width: double.infinity,
                            color: Theme
                                .of(context)
                                .secondaryHeaderColor,
                            child: Center(
                                child: Text(
                                  'Upcoming',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: Text(
                                          index == 0 ?
                                          'Dr.Wael Hassan' : 'Ahmed Osman',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16))),
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: Text(controller
                                          .appointments[index].category?.name ??
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
                                    Icons.arrow_forward_ios, size: 20,))
                            ],
                          )
                        ],
                      ),
                    ),
                  )
          );
        }),
      ),
    );
  }
}
