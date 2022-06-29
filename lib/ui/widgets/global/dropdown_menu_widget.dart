import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DropDownWidget extends StatelessWidget {
  final List<DropdownMenuItem<String>> list;
  final String? label;
  final double? padding;
  const DropDownWidget({Key? key, required this.list, this.label, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0.0),
      child: DropdownButtonFormField(
        items: list,
        hint: Text(
          label?.tr ?? "completeInfo".tr,
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey,
          ),
        ),
        onChanged: (String? newValue) {},
        validator: (value) {
          if (value == null) {
            return 'Please choose a payment method';
          }
          return null;
        },
        decoration: InputDecoration(
          fillColor: const Color(0xfff8f7fb),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Color(0xffd5e1e8),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
      ),
    );
  }
}
