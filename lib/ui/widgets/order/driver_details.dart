import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/data/models/user.dart';
import 'package:logistic/services/helpers.dart';

class DriverDetails extends StatelessWidget {
  User? driver;

  DriverDetails(this.driver, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 104.h,
        width: 382.w,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.person,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  width: 17.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      driver?.fullName ?? '',
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      driver?.driver?.vehicleType?.vehicleNameAr ?? '',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 81.h,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.message,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 13.w,
                ),
                InkWell(
                  onTap: () => launchPhone(driver?.phoneNumber ?? ''),
                  child: Container(
                    height: 81.h,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
