import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healMe/data/api/apiService.dart';
import 'package:healMe/data/api/api_checker.dart';
import 'package:healMe/data/models/appointment.dart';
import 'package:healMe/data/models/category.dart';
import 'package:healMe/data/models/doctor.dart';
import 'package:healMe/data/models/doctor.dart';
import 'package:healMe/data/models/doctor.dart';
import 'package:healMe/data/models/user.dart';
import 'package:healMe/data/repository/appointment_repo.dart';
import 'package:healMe/data/repository/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:healMe/services/helpers.dart';
import 'package:healMe/services/localStorage.dart';
import 'package:healMe/ui/screens/auth/complete_info.dart';
import 'package:healMe/ui/screens/auth/login.dart';
import 'package:healMe/ui/screens/auth/otp.dart';
import 'package:healMe/ui/screens/splash_screen.dart';

class AppointmentController extends GetxController {
  final appointmentRepo = Get.find<AppointmentRepo>();
  final storage = Get.find<LocalStorage>();

  bool _loading = false;

  bool get loading => _loading;

  Category? _selectedCategory;

  Category? get selectedCategory => _selectedCategory;

  set selectedCategory(Category? value) {
    _selectedCategory = value;
    update();
  }

  List<Category> _categories = [];

  List<Category> get categories => _categories;

  set categories(List<Category> value) {
    _categories = value;
  }

  void getCategories() async {
    _categories = [];
    _loading = true;
    // update();
    http.Response response = await appointmentRepo.getCategories();
    List myList = json.decode(response.body);
    if (response.statusCode == 200) {
      myList.forEach((element) {
        _categories.add(Category.fromJson(element));
      });
      _loading = false;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }

  List<Timeslot> _timeSlots = [];

  List<Timeslot> get timeSlots => _timeSlots;

  set timeSlots(List<Timeslot> value) {
    _timeSlots = value;
  }


  Timeslot? _selectedSlot;

  Timeslot? get selectedSlot => _selectedSlot;

  set selectedSlot(Timeslot? value) {
    _selectedSlot = value;
    update();
  }

  void geTimeSlots() async {
    _timeSlots = [];
    _loading = true;
    // update();
    http.Response response = await appointmentRepo.getTimeSlots();
    List myList = json.decode(response.body);
    if (response.statusCode == 200) {
      myList.forEach((element) {
        _timeSlots.add(Timeslot.fromJson(element));
      });
      _loading = false;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }

  List<Appointment> _appointments = [];

  List<Appointment> get appointments => _appointments;

  set appointments(List<Appointment> value) {
    _appointments = value;
  }

  void getAppointments() async {
    _appointments = [];
    _loading = true;
    // update();
    String id = Get.find<LocalStorage>().getUser()?.id ?? '';
    http.Response response = await appointmentRepo.getAppointments(id);
    List myList = json.decode(response.body);
    if (response.statusCode == 200) {
      myList.forEach((element) {
        _appointments.add(Appointment.fromJson(element));
      });
      _loading = false;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }

  List<Doctor> _doctors = [];

  List<Doctor> get doctors => _doctors;

  set doctors(List<Doctor> value) {
    _doctors = value;
  }

  String? _doctorId;


  String? get doctorId => _doctorId;

  set doctorId(String? value) {
    _doctorId = value;
  }

  void getDoctors() async {
    _doctors = [];
    _loading = true;
    http.Response response =
        await appointmentRepo.getDoctors(_selectedCategory?.id ?? '');
    List myList = json.decode(response.body);
    if (response.statusCode == 200) {
      myList.forEach((element) {
        _doctors.add(Doctor.fromJson(element));
      });
      _loading = false;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }

  void addAppointments() async {
    _loading = true;
    update();
    String id = Get.find<LocalStorage>().getUser()?.id ?? '';
    http.Response response = await appointmentRepo.addAppointment(
        id: id,
        categoryId: _selectedCategory?.id ?? '',
        categoryName: _selectedCategory?.name ?? '',
      slotId: _selectedSlot?.num??0,
        slotName: _selectedSlot?.str ?? '',
      doctorId: doctorId??''

    );
    Map<String, dynamic> responseMap = json.decode(response.body);
    if (responseMap["status"] == 1) {
      showToast(responseMap["msg"]);
      _loading = false;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
  }
}
