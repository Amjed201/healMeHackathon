import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySeparator extends StatelessWidget {
  const MySeparator({
    Key? key,
    this.height = 1,
    this.color = Colors.black,
    required this.width,
  }) : super(key: key);
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final boxWidth = width;
    var dashWidth = 5.w;
    final dashHeight = height;
    final dashCount = (boxWidth / (2 * dashWidth)).floor();
    return SizedBox(
      child: Flex(
        children: List.generate(
          dashCount,
          (_) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child: SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              ),
            );
          },
        ),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
      ),
    );
  }
}
