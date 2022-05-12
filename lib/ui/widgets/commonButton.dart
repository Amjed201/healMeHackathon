import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientButton extends StatelessWidget {
  String title;
  Function() onTap;
  double height;

  GradientButton(this.title, this.onTap, [this.height = 55]);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          height: height,
          width: 400.w,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                  colors: [Color(0xff387D7E), const Color(0xff27595A)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
          child: Center(
              child: AutoSizeText(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
            ),
          )),
        ),
      ),
    );
  }
}
