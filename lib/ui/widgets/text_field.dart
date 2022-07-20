import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const MyTextField(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380.w,
      height: 69.h,
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.done,
        onEditingComplete: () => FocusManager.instance.primaryFocus?.unfocus(),
        validator: (value) {
          if (!GetUtils.isPhoneNumber(value!)) {
            return 'Please enter ' + hintText;
          } else if (value.length != 10) {
            return 'Short' + hintText;
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.black26,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
      ),
    );
  }
}
