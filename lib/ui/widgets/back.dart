import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopButton extends StatelessWidget {
  final Function()? onTap;
  const PopButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Get.back(),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff808594),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.adaptive.arrow_back,
              color: const Color(0xff808594),
            ),
          ),
        ),
      ),
    );
  }
}
