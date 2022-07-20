import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/auth_controller.dart';
import 'package:logistic/controllers/contacts_controller.dart';
import 'package:logistic/ui/screens/profile/add_contact_screen.dart';
import 'package:logistic/ui/widgets/global/loading.dart';

class ManageContacts extends StatefulWidget {
  @override
  State<ManageContacts> createState() => _ManageContactsState();
}

class _ManageContactsState extends State<ManageContacts> {
  @override
  void initState() {
    super.initState();
    Get.find<ContactsController>().getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: const Icon(
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
        onPressed: () => Get.to(() => AddContact('addContact')),
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
      body: GetBuilder<ContactsController>(
        builder: (controller) => controller.loading
            ? const LoadingWidget()
            : controller.contacts.isEmpty
                ? Center(
                    child: Text('noContacts'.tr),
                  )
                : SafeArea(
                    child: ListView.separated(
                    itemCount: controller.contacts.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => Get.to(() => AddContact(
                            'editContact',
                            contact: controller.contacts[index],
                          )),
                      child: ListTile(
                        leading: Text(
                          '${index + 1}',
                          style:
                              const TextStyle(fontSize: 35, color: Colors.grey),
                        ),
                        title: AutoSizeText(
                          controller.contacts[index].name ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        subtitle: Text(
                          controller.contacts[index].primaryPhone ?? '',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        trailing: InkWell(
                          onTap: () => controller.confirmToDelete(
                              controller.contacts[index].id ?? 0),
                          child: const Icon(
                            Icons.delete_forever,
                            color: Color(0xffe66a6a),
                          ),
                        ),
                      ),
                    ),
                  )),
      ),
    );
  }
}
