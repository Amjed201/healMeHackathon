import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/authController.dart';

class ManageContacts extends StatefulWidget {
  @override
  State<ManageContacts> createState() => _ManageContactsState();
}

class _ManageContactsState extends State<ManageContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                  colors: [Color(0xff387D7A), Color(0xff27595A)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
        ),
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: AutoSizeText(
          'manageContacts'.tr,
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView.separated(
        itemCount: 2,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => ListTile(
          leading: Text(
            '${index + 1}',
            style: TextStyle(fontSize: 35, color: Colors.grey),
          ),
          title: const Text(
            'محمد عبدالله',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          subtitle: Text(
            '(+966) 123 456 789',
            style: TextStyle(color: Colors.grey[400]),
          ),
          trailing: const Icon(
            Icons.delete_forever,
            color: Color(0xffe66a6a),
          ),
        ),
      )),
    );
  }
}
