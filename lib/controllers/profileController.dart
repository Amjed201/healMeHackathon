import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logistic/models/requests/updateUser.dart';
import 'package:logistic/models/user.dart';
import 'package:logistic/services/apiService.dart';
import 'package:logistic/services/localStorage.dart';

class ProfileController extends GetxController {
  bool _mainLoading = false;
  bool _isEditing = false;

  List<DropdownMenuItem<String>> _genders = [
    const DropdownMenuItem(child: Text("Male"), value: "Male"),
    const DropdownMenuItem(child: const Text("Female"), value: "Female"),
  ];

  List<DropdownMenuItem<String>> _cities = [];
  City? _selectedCity;

  set selectedCity(City? value) {
    _selectedCity = value;
    update();
  }

  City? get selectedCity => _selectedCity;

  List<DropdownMenuItem<String>> get cities => _cities;

  List<DropdownMenuItem<String>> _neighborhoods = [];
  City? _selectedNeighborhood;

  set selectedNeighborhood(City? value) {
    _selectedCity = value;
    update();
  }

  City? get selectedNeighborhood => _selectedNeighborhood;

  List<DropdownMenuItem<String>> get neighborhoods => _neighborhoods;

  List<DropdownMenuItem<String>> get genders => _genders;

  Gender? _selectedGender;

  set isEditing(bool value) {
    _isEditing = value;
    update();
  }

  bool get mainLoading => _mainLoading;

  bool get isEditing => _isEditing;

  final api = Get.find<ApiService>();

  File? get image => _image;
  File? _image;
  final picker = ImagePicker();

  void toggleEditing() {
    _isEditing = !isEditing;
    update();
  }

  Future getImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 75);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    update();
  }

  updateUser({required UpdateUser user, required BuildContext context}) async {
    try {
      _mainLoading = true;
      update();
      await api.updateUser(user, context);
      _mainLoading = false;
      update();
    } catch (e) {
      print(e.toString());
      _mainLoading = false;
      update();
    }
  }

  getCities({required BuildContext context}) async {
    try {
      update();
      List<City> cityList = await api.getCities(context);
      _cities = [];
      for (var element in cityList) {
        _cities.add(DropdownMenuItem(
            child: Text(element.enName ?? ''), value: element.enName));
      }
      print(_cities.length);
      update();
    } catch (e) {
      print(e.toString());
      update();
    }
  }

  getNeighborhoods({required BuildContext context}) async {
    try {
      update();
      List<City> neighborhoods = await api.getNeighborhoods(context);
      _neighborhoods = [];
      for (var element in neighborhoods) {
        _neighborhoods.add(DropdownMenuItem(
            child: Text(element.enName ?? ''), value: element.enName));
      }
      print(_neighborhoods.length);
      update();
    } catch (e) {
      print(e.toString());
      update();
    }
  }

  Gender? get selectedGender => _selectedGender;

  set selectedGender(Gender? value) {
    _selectedGender = value;
    update();
  }

  set image(File? value) {
    _image = value;
  }
}
