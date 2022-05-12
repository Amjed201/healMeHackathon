import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
              border: Border.all(
                  color: Colors.grey[300]!, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
      ),
    );
  }
}
