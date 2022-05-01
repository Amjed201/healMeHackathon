import 'package:get/get.dart';

class User {
  User({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.emailVerifiedAt,
    this.dob,
    this.image,
    this.genderId,
    this.userTypeId,
    this.cityId,
    this.neighborhoodId,
    this.lastLogin,
    this.lastInteractive,
    this.code,
    this.codeExpiresAt,
    this.lang,
    this.isActive,
    this.isVerified,
    this.deletedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
    this.gender,
    this.userType,
    this.city,
    this.neighborhood,
  });

  int? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  dynamic emailVerifiedAt;
  String? dob;
  String? image;
  int? genderId;
  dynamic userTypeId;
  int? cityId;
  int? neighborhoodId;
  dynamic lastLogin;
  String? lastInteractive;
  int? code;
  String? codeExpiresAt;
  String? lang;
  int? isActive;
  int? isVerified;
  dynamic deletedAt;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? profilePhotoUrl;
  Gender? gender;
  dynamic userType;
  City? city;
  City? neighborhood;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        dob: json["dob"],
        image: json["image"],
        genderId: json["gender_id"],
        userTypeId: json["user_type_id"],
        cityId: json["city_id"],
        neighborhoodId: json["neighborhood_id"],
        lastLogin: json["last_login"],
        lastInteractive: json["last_interactive"],
        code: json["code"],
        codeExpiresAt: json["code_expires_at"],
        lang: json["lang"],
        isActive: json["is_active"],
        isVerified: json["is_verified"],
        deletedAt: json["deleted_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        profilePhotoUrl: json["profile_photo_url"],
        gender: json["gender"] == null ? null : Gender.fromJson(json["gender"]),
        userType: json["user_type"],
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        neighborhood: json["neighborhood"] == null
            ? null
            : City.fromJson(json["neighborhood"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "phone_number": phoneNumber,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "dob": dob,
        "gender_id": genderId,
        "user_type_id": userTypeId,
        "city_id": cityId,
        "neighborhood_id": neighborhoodId,
        "last_login": lastLogin,
        "last_interactive": lastInteractive,
        "code": code,
        "code_expires_at": codeExpiresAt,
        "lang": lang,
        "is_active": isActive,
        "is_verified": isVerified,
        "deleted_at": deletedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "profile_photo_url": profilePhotoUrl,
        "gender": gender,
        "user_type": userType,
        "city": city,
        "neighborhood": neighborhood,
      };
}

class City {
  City({
    this.id,
    this.name,
    this.enName,
    this.sorting,
    this.isActive,
    this.countryId,
    this.cityId,
  });

  int? id;
  String? name;
  String? enName;
  int? sorting;
  int? isActive;
  int? countryId;

  int? cityId;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        enName:
            Get.locale!.languageCode == 'ar' ? json["name"] : json["en_name"],
        sorting: json["sorting"],
        isActive: json["is_active"],
        countryId: json["country_id"] == null ? null : json["country_id"],
        cityId: json["city_id"] == null ? null : json["city_id"],
      );
}

class Gender {
  Gender({
    this.id,
    this.name,
    this.enName,
  });

  int? id;
  String? name;
  String? enName;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json["id"],
        name: json["name"],
        enName:
            Get.locale!.languageCode == 'ar' ? json["name"] : json["en_name"],
      );
}
