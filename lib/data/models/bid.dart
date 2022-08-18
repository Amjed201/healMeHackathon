import 'package:logistic/data/models/user.dart';

class Bid {
  Bid({
    this.id,
    this.driverId,
    this.orderId,
    this.price,
    this.dropOffTime,
    this.isPartial,
    this.partialNote,
    this.isAccepted,
    this.createdAt,
    this.updatedAt,
    this.driverUser,
  });

  Bid.fromJson(dynamic json) {
    id = json['id'];
    driverId = json['driverId'];
    orderId = json['orderId'];
    price = json['price'];
    dropOffTime = json['dropOffTime'];
    isPartial = json['isPartial'];
    partialNote = json['partialNote'];
    isAccepted = json['isAccepted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    driverUser = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  int? id;
  int? driverId;
  int? orderId;
  int? price;
  String? dropOffTime;
  bool? isPartial;
  dynamic partialNote;
  bool? isAccepted;
  String? createdAt;
  String? updatedAt;
  User? driverUser;
}


