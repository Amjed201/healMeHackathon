import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healMe/controllers/appointment_controller.dart';
import 'package:healMe/services/helpers.dart';
import 'package:healMe/ui/screens/result_screen.dart';
import 'package:healMe/ui/widgets/global/loading.dart';

class AddAppointment extends StatefulWidget {
  const AddAppointment({Key? key}) : super(key: key);

  @override
  State<AddAppointment> createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<AppointmentController>().getCategories();
    Get.find<AppointmentController>().getAppointments();
    Get.find<AppointmentController>().getDoctors();
    Get.find<AppointmentController>().geTimeSlots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Appoinments',style: TextStyle(fontSize: 16),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<AppointmentController>(builder: (controller) {
        return SafeArea(
            child: controller.loading
                ? LoadingWidget()
                : Column(
                    children: [
                      SizedBox(height: 20.h,),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        height: 65.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categories.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      controller.selectedCategory =
                                          controller.categories[index];
                                      controller.getDoctors();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: controller.selectedCategory ==
                                                controller.categories[index]
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey[200],
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Center(
                                            child: Text(
                                          '${controller.categories[index].name}',
                                          style: TextStyle(
                                            color: controller
                                                        .selectedCategory ==
                                                    controller.categories[index]
                                                ? Colors.white
                                                : Color(0xff707070),
                                          ),
                                        )),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                      SizedBox(height: 20.h,),

                      Expanded(
                        child: ListView.builder(
                            itemCount: controller.doctors.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/dr.png',
                                          fit: BoxFit.cover,
                                          height: 90.h,
                                          width: 130.h,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.doctors[index].name ??
                                                  '',
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xff083243),
                                                  fontSize: 16,
                                                 ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  color: Colors.grey[500],
                                                ),
                                                Text(
                                                  controller.doctors[index]
                                                          .hospital ??
                                                      '',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.grey[500],
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            if (controller.selectedCategory ==
                                                null) {
                                              showToast(
                                                  'Please select a specialization');
                                            } else {
                                              controller.doctorId = controller.doctors[index].id??'';
                                              Get.defaultDialog(
                                                  title:
                                                      'Pick the preferred time',
                                                  titleStyle: TextStyle(fontSize: 16),
                                                  titlePadding: EdgeInsets.all(10),

                                                  content: Container(
                                                    height: 100,
                                                    child: Center(
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 60.h,
                                                            width: 600.w,
                                                            child: GetBuilder<
                                                                    AppointmentController>(
                                                                builder: (cont) {
                                                              return ListView
                                                                  .builder(
                                                                      scrollDirection:
                                                                          Axis
                                                                              .horizontal,
                                                                      itemCount: cont
                                                                          .timeSlots
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                                  index) =>
                                                                              Padding(
                                                                                padding:
                                                                                    const EdgeInsets.all(8.0),
                                                                                child:
                                                                                    InkWell(
                                                                                  onTap: () {
                                                                                    cont.selectedSlot = cont.timeSlots[index];
                                                                                    cont.update();
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: cont.selectedSlot == cont.timeSlots[index] ? Theme.of(context).primaryColor : Colors.grey[200],
                                                                                      borderRadius: BorderRadius.circular(6),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.all(6.0),
                                                                                      child: Center(
                                                                                          child: Text(
                                                                                        cont.timeSlots[index].str ?? '',
                                                                                        style: TextStyle(
                                                                                          color: cont.selectedSlot == cont.timeSlots[index] ? Colors.white : Color(0xff707070),
                                                                                        ),
                                                                                      )),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ));
                                                            }),
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        20.w),
                                                            child: InkWell(
                                                              onTap: (){
                                                                Get.back();
                                                                controller.addAppointments();
                                                              },
                                                              child: Text(
                                                                'Confirm',
                                                                textAlign:
                                                                    TextAlign.center,
                                                                style: TextStyle(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    fontSize: 14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            child: Text(
                                              'Book',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                      ),
                    ],
                  ));
      }),
    );
  }
}
