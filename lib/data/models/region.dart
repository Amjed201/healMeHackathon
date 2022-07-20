import 'dart:convert';

class Region {
  int? id;
  int? countryId;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;

  Region({
    this.id,
    this.countryId,
    this.nameAr,
    this.nameEn,
    this.createdAt,
    this.updatedAt,
  });

  Region.fromJson(dynamic json) {
    id = json['id'];
    countryId = json['countryId'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
