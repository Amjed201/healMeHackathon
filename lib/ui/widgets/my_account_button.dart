import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAccountButton extends StatelessWidget {
  final IconData icon;
  final String? label;
  final Function()? onTap;
  const MyAccountButton({
    Key? key,
    required this.icon,
    this.onTap,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.grey,
                  size: 17.sp,
                ),
                SizedBox(
                  width: 15.w,
                ),
                AutoSizeText(
                  label ?? "",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 17.sp,
            )
          ],
        ),
      ),
    );
  }
}
