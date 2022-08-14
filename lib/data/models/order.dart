import 'package:logistic/data/models/user.dart';

class Order {
  Order({
      this.id, 
      this.referenceId, 
      this.userId, 
      this.cityPickup, 
      this.cityDropOff, 
      this.regionPickup, 
      this.regionDropOff, 
      this.user, 
      this.orderTiming, 
      this.paymentType, 
      this.pickupRegion, 
      this.pickupCity, 
      this.dropOffRegion, 
      this.dropOffCity, 
      this.pickupTime, 
      this.dropOffContact, 
      this.details, 
      this.pickupLocationLng, 
      this.pickupLocationLat, 
      this.dropOffLocationLng, 
      this.dropOffLocationLat, 
      this.vehicleType, 
      this.assignedBid, 
      this.status, 
      this.canceledBy, 
      this.cancelationNote,});

  int? id;
  String? referenceId;
  int? userId;
  CityPickup? cityPickup;
  CityDropOff? cityDropOff;
  RegionPickup? regionPickup;
  RegionDropOff? regionDropOff;
  User? user;
  OrderTiming? orderTiming;
  String? paymentType;
  int? pickupRegion;
  int? pickupCity;
  int? dropOffRegion;
  int? dropOffCity;
  String? pickupTime;
  int? dropOffContact;
  String? details;
  String? pickupLocationLng;
  String? pickupLocationLat;
  String? dropOffLocationLng;
  String? dropOffLocationLat;
  int? vehicleType;
  int? assignedBid;
  String? status;
  int? canceledBy;
  String? cancelationNote;

  Order.fromJson(dynamic json) {
    id = json['id'];
    referenceId = json['referenceId'];
    userId = json['userId'];
    cityPickup = json['cityPickup'] != null ? CityPickup.fromJson(json['cityPickup']) : null;
    cityDropOff = json['cityDropOff'] != null ? CityDropOff.fromJson(json['cityDropOff']) : null;
    regionPickup = json['regionPickup'] != null ? RegionPickup.fromJson(json['regionPickup']) : null;
    regionDropOff = json['regionDropOff'] != null ? RegionDropOff.fromJson(json['regionDropOff']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    orderTiming = json['orderTiming'] != null ? OrderTiming.fromJson(json['orderTiming']) : null;
    paymentType = json['paymentType'];
    pickupRegion = json['pickupRegion'];
    pickupCity = json['pickupCity'];
    dropOffRegion = json['dropOffRegion'];
    dropOffCity = json['dropOffCity'];
    pickupTime = json['pickupTime'];
    dropOffContact = json['dropOffContact'];
    details = json['details'];
    pickupLocationLng = json['pickupLocationLng'];
    pickupLocationLat = json['pickupLocationLat'];
    dropOffLocationLng = json['dropOffLocationLng'];
    dropOffLocationLat = json['dropOffLocationLat'];
    vehicleType = json['vehicleType'];
    assignedBid = json['assignedBid'];
    status = json['status'];
    canceledBy = json['canceledBy'];
    cancelationNote = json['cancelationNote'];
  }

}

class OrderTiming {
  OrderTiming({
      this.id, 
      this.orderId, 
      this.startedAt, 
      this.goingToPickupAt, 
      this.arrivedOnPickupAt, 
      this.loadedInAt, 
      this.goingToDropOffAt, 
      this.arrivedOnDropOffAt, 
      this.loadedOffAt, 
      this.completedAt, 
      this.canceledAt,});

  OrderTiming.fromJson(dynamic json) {
    id = json['id'];
    orderId = json['orderId'];
    startedAt = json['startedAt'];
    goingToPickupAt = json['goingToPickupAt'];
    arrivedOnPickupAt = json['arrivedOnPickupAt'];
    loadedInAt = json['loadedInAt'];
    goingToDropOffAt = json['goingToDropOffAt'];
    arrivedOnDropOffAt = json['arrivedOnDropOffAt'];
    loadedOffAt = json['loadedOffAt'];
    completedAt = json['completedAt'];
    canceledAt = json['canceledAt'];
  }
  int? id;
  int? orderId;
  String? startedAt;
  String? goingToPickupAt;
  String? arrivedOnPickupAt;
  String? loadedInAt;
  String? goingToDropOffAt;
  String? arrivedOnDropOffAt;
  String? loadedOffAt;
  String? completedAt;
  String? canceledAt;


}


class RegionDropOff {
  RegionDropOff({
      this.id, 
      this.nameAr, 
      this.nameEn, 
      this.countryId, 
      this.createdAt, 
      this.updatedAt,});

  RegionDropOff.fromJson(dynamic json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    countryId = json['countryId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? nameAr;
  String? nameEn;
  int? countryId;
  String? createdAt;
  String? updatedAt;


}

class RegionPickup {
  RegionPickup({
      this.id, 
      this.nameAr, 
      this.nameEn, 
      this.countryId, 
      this.createdAt, 
      this.updatedAt,});

  RegionPickup.fromJson(dynamic json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    countryId = json['countryId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? nameAr;
  String? nameEn;
  int? countryId;
  String? createdAt;
  String? updatedAt;

}

class CityDropOff {
  CityDropOff({
      this.id, 
      this.nameAr, 
      this.nameEn, 
      this.countryId, 
      this.regionId, 
      this.createdAt, 
      this.updatedAt,});

  CityDropOff.fromJson(dynamic json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    countryId = json['countryId'];
    regionId = json['regionId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? nameAr;
  String? nameEn;
  int? countryId;
  int? regionId;
  String? createdAt;
  String? updatedAt;

}

class CityPickup {
  CityPickup({
      this.id, 
      this.nameAr, 
      this.nameEn, 
      this.countryId, 
      this.regionId, 
      this.createdAt, 
      this.updatedAt,});

  CityPickup.fromJson(dynamic json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    countryId = json['countryId'];
    regionId = json['regionId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? nameAr;
  String? nameEn;
  int? countryId;
  int? regionId;
  String? createdAt;
  String? updatedAt;

}