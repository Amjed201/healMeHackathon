// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.id,
    this.name,
    this.enName,
    this.image,
    this.icon,
    this.sorting,
    this.isActive,
  });

  int? id;
  String? name;
  String? enName;
  String? image;
  String? icon;
  int? sorting;
  int? isActive;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        enName:
            Get.locale!.languageCode == 'ar' ? json["name"] : json["en_name"],
        image: json["image"],
        icon: json["icon"],
        sorting: json["sorting"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "en_name": enName,
        "image": image,
        "icon": icon,
        "sorting": sorting,
        "is_active": isActive,
      };
}

SubCategory subCategoryFromJson(String str) =>
    SubCategory.fromJson(json.decode(str));

String subCategoryToJson(SubCategory data) => json.encode(data.toJson());

class SubCategory {
  SubCategory({
    this.id,
    this.categoryId,
    this.name,
    this.enName,
    this.image,
    this.icon,
    this.sorting,
    this.isActive,
  });

  int? id;
  int? categoryId;
  String? name;
  String? enName;
  String? image;
  String? icon;
  int? sorting;
  int? isActive;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        categoryId: json["offer_category_id"],
        name: json["name"],
        enName:
            Get.locale!.languageCode == 'ar' ? json["name"] : json["en_name"],
        image: json["image"],
        icon: json["icon"],
        sorting: json["sorting"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "en_name": enName,
        "image": image,
        "icon": icon,
        "sorting": sorting,
        "is_active": isActive,
      };
}
