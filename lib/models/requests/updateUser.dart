import 'dart:io';

class UpdateUser {
  UpdateUser({
    this.fullName,
    this.phoneNumber,
    this.password,
    this.email,
    this.dob,
    this.genderId,
    this.cityId,
    this.neighborhoodId,
    this.lang,
    this.image
  });

  String? fullName;
  String? phoneNumber;
  String? password;
  String? email;
  String? dob;
  int? genderId;
  int? cityId;
  int? neighborhoodId;
  String? lang;
  File? image;

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "phone_number": phoneNumber,
        "password": password,
        "email": email,
        "dob": dob,
        "gender_id": genderId,
        "city_id": cityId,
        "neighborhood_id": neighborhoodId,
        "lang": lang,
        "image": image,
      };
}
