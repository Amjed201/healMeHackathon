class Bid {
  Bid({
      this.id, 
      this.driverId, 
      this.orderId, 
      this.isAccepted, 
      this.price, 
      this.dropOffDate, 
      this.isPartial, 
      this.partialNotes, 
      this.createdAt, 
      this.updatedAt,});

  Bid.fromJson(dynamic json) {
    id = json['id'];
    driverId = json['driverId'];
    orderId = json['orderId'];
    isAccepted = json['isAccepted'];
    price = json['price'];
    dropOffDate = json['dropOffDate'];
    isPartial = json['isPartial'];
    partialNotes = json['partialNotes'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  int? driverId;
  int? orderId;
  bool? isAccepted;
  int? price;
  String? dropOffDate;
  bool? isPartial;
  String? partialNotes;
  String? createdAt;
  String? updatedAt;

}