import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DottedDivider extends StatelessWidget {
  int length;

  DottedDivider({Key? key, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i < length; i++)
          Container(
            margin: EdgeInsets.symmetric(vertical: 1.h),
            height: 5.h,
            width: 2.w,
            color: Colors.grey[400],
          )
      ],
    );
  }
}
