class Order {
  int? id;
  String? referenceId;
  int? userId;
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

  Order({
    this.id,
    this.referenceId,
    this.userId,
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
    this.cancelationNote,
  });

  Order.fromJson(dynamic json) {
    id = json['id'];
    referenceId = json['referenceId'];
    userId = json['userId'];
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
