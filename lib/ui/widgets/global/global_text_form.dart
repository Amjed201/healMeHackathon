import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalTextForm extends StatelessWidget {
  const GlobalTextForm({
    Key? key,
    required this.controller,
    required this.isEnabled,
    this.w = 200,
    required this.label,
    this.color = Colors.white,
  }) : super(key: key);
  final TextEditingController controller;
  final double w;
  final String label;
  final Color color;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      child: TextFormField(
        controller: controller,
        enabled: isEnabled,
        keyboardType: TextInputType.text,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          fillColor: color,
          filled: true,
          // enabled: isEnabled,
          hintText: label.tr,
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffd5e1e8),
            ),
          ),
        ),
      ),
    );
  }
}
