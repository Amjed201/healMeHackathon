import 'package:logistic/data/models/vehicle.dart';

class Driver {
  Driver({
    this.id,
    this.name,
    this.userId,
    this.vehicleTypeId,
    this.vehicleNumber,
    this.idPhoto,
    this.driverLicensePhoto,
    this.isOwner,
    this.ownershipLicensePhoto,
    this.ownerIdPhoto,
    this.ownershipContractPhoto,
    this.vehiclePhotos,
    this.preferredCity,
    this.preferredRegion,
    this.confirmed,
    this.confirmedAt,
    this.confirmationNote,
    this.balance,
    this.bounceBalance,
    this.ratingCount,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.vehicleType,
  });

  Driver.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    userId = json['userId'];
    vehicleTypeId = json['vehicleTypeId'];
    vehicleNumber = json['vehicleNumber'];
    idPhoto = json['idPhoto'];
    driverLicensePhoto = json['driverLicensePhoto'];
    isOwner = json['isOwner'];
    ownershipLicensePhoto = json['ownershipLicensePhoto'];
    ownerIdPhoto = json['ownerIdPhoto'];
    ownershipContractPhoto = json['ownershipContractPhoto'];
    vehiclePhotos = json['vehiclePhotos'];
    preferredCity = json['preferredCity'];
    preferredRegion = json['preferredRegion'];
    confirmed = json['confirmed'];
    confirmedAt = json['confirmedAt'];
    confirmationNote = json['confirmationNote'];
    balance = json['balance'];
    bounceBalance = json['bounceBalance'];
    ratingCount = json['ratingCount'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    vehicleType = json['vehicleType'] != null
        ? Vehicle.fromJson(json['vehicleType'])
        : null;
  }

  int? id;
  String? name;
  int? userId;
  int? vehicleTypeId;
  String? vehicleNumber;
  String? idPhoto;
  String? driverLicensePhoto;
  bool? isOwner;
  dynamic ownershipLicensePhoto;
  dynamic ownerIdPhoto;
  dynamic ownershipContractPhoto;
  String? vehiclePhotos;
  int? preferredCity;
  int? preferredRegion;
  String? confirmed;
  dynamic confirmedAt;
  dynamic confirmationNote;
  int? balance;
  int? bounceBalance;
  int? ratingCount;
  int? rating;
  String? createdAt;
  String? updatedAt;
  Vehicle? vehicleType;
}
