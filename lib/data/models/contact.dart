class Contact {
  Contact({
    this.id,
    this.name,
    this.primaryPhone,
    this.secondaryPhone,
    this.countryCode,
    this.userId,
  });

  int? id;
  String? name;
  String? primaryPhone;
  String? secondaryPhone;
  String? countryCode;
  int? userId;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        name: json["name"],
        primaryPhone: json["primaryPhone"],
        secondaryPhone: json["secondaryPhone"],
        countryCode: json["countryCode"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "primaryPhone": primaryPhone,
        "secondaryPhone": secondaryPhone,
        "countryCode": countryCode,
        "userId": userId,
      };
}
