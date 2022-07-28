import 'dart:convert';

class Vehicle {

  int? id;
  String? icon;
  String? vehicleNameAr;
  String? vehicleNameEn;
  int? createdBy;


  Vehicle({
    this.id,
    this.icon,
    this.vehicleNameAr,
    this.vehicleNameEn,
    this.createdBy,
  });

  Vehicle.fromJson(dynamic json) {
    id = json['id'];
    icon = json['icon'];
    vehicleNameAr = json['vehicleNameAr'];
    vehicleNameEn = json['vehicleNameEn'];
    createdBy = json['createdBy'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['icon'] = icon;
    map['vehicleNameAr'] = vehicleNameAr;
    map['vehicleNameEn'] = vehicleNameEn;
    map['createdBy'] = createdBy;
    return map;
  }
}
