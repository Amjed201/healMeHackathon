class Country {
  int? id;
  String? nameAr;
  String? nameEn;
  String? countryCode;
  String? phoneCode;
  String? createdAt;
  String? updatedAt;

  Country({
    this.id,
    this.nameAr,
    this.nameEn,
    this.countryCode,
    this.phoneCode,
    this.createdAt,
    this.updatedAt,
  });

  Country.fromJson(dynamic json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    countryCode = json['countryCode'];
    phoneCode = json['phoneCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
