import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientButton extends StatelessWidget {
  String title;
  Function() onTap;
  double height;
  bool isDisabled;

  GradientButton(this.title, this.onTap, {this.height = 55,this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
      isDisabled?
          null:
      onTap,
      child: Center(
        child: Container(
          height: height,
          width: 400.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient:
               LinearGradient(
                  colors:
                  isDisabled?
                  [Color(0xffe5e5e5),Color(0xffe5e5e5)]:
                  [const Color(0xff1B9CED), const Color(0xff2BDABA)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
          child: Center(
              child: AutoSizeText(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              color:
              isDisabled?

              Color(0xff083243):
              Colors.white,
            ),
          )),
        ),
      ),
    );
  }
}
