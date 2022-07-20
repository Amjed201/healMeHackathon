import 'dart:convert';

class City {
  int? id;
  int? countryId;
  int? regionId;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;

  City({
    this.id,
    this.countryId,
    this.regionId,
    this.nameAr,
    this.nameEn,
    this.createdAt,
    this.updatedAt,
  });

  City.fromJson(dynamic json) {
    id = json['id'];
    countryId = json['countryId'];
    regionId = json['regionId'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
