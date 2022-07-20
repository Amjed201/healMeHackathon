import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/auth_controller.dart';
import 'package:logistic/controllers/contacts_controller.dart';
import 'package:logistic/controllers/profile_controller.dart';
import 'package:logistic/data/models/contact.dart';
import 'package:logistic/services/helpers.dart';
import 'package:logistic/services/localStorage.dart';
import 'package:logistic/ui/screens/tabs_screen.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/global/loading.dart';
import 'package:logistic/ui/widgets/text_field.dart';

class AddContact extends StatefulWidget {
  String title;
  Contact? contact;

  AddContact(this.title, {this.contact});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final _nameController = TextEditingController();
  final _primaryPhoneController = TextEditingController();
  final _secondaryPhoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.contact?.name ?? '';
    _primaryPhoneController.text = widget.contact?.primaryPhone ?? '';
    _secondaryPhoneController.text = widget.contact?.secondaryPhone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: AutoSizeText(
          widget.title.tr,
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 380.w,
                        height: 69.h,
                        child: TextFormField(
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                          textDirection: TextDirection.ltr,
                          onEditingComplete: () =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          keyboardType: TextInputType.text,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'name'.tr,
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
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
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: SizedBox(
                        width: 380.w,
                        height: 69.h,
                        child: TextFormField(
                          controller: _primaryPhoneController,
                          textInputAction: TextInputAction.done,
                          textDirection: TextDirection.ltr,
                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            hintText: 'phone'.tr,
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                              child: Text(
                                '+966',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            // hintText: 'phone'.tr,
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
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
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: SizedBox(
                        width: 380.w,
                        height: 69.h,
                        child: TextFormField(
                          controller: _secondaryPhoneController,
                          textInputAction: TextInputAction.done,
                          textDirection: TextDirection.ltr,
                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            hintText: 'secondaryPhone'.tr,
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                              child: Text(
                                '+966',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
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
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50.h,
            child: GetBuilder<ContactsController>(
              builder: (controller) => controller.loading
                  ? const LoadingWidget()
                  : GradientButton('add'.tr, () {
                      if (_nameController.text.length == 0 ||
                          _primaryPhoneController.text.length == 0) {
                        showToast('enterFields'.tr);
                      } else {
                        widget.title == 'addContact'
                            ? controller.addNewContact(
                                name: _nameController.text,
                                countryCode: '+249',
                                primaryPhone: _primaryPhoneController.text,
                                secondaryPhone:
                                    _secondaryPhoneController.text.length == 0
                                        ? null
                                        : _secondaryPhoneController.text)
                            : controller.updateContact(
                                id: widget.contact?.id ?? 0,
                                name: _nameController.text,
                                countryCode: '+249',
                                primaryPhone: _primaryPhoneController.text,
                                secondaryPhone:
                                    _secondaryPhoneController.text.length == 0
                                        ? null
                                        : _secondaryPhoneController.text);
                      }
                    }),
            ),
          ),
        ],
      )),
    );
  }
}
