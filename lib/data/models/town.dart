class Town {
  int? id;
  String? nameAr;
  String? nameEn;
  int? countryId;
  int? regionId;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  Town({
    this.id,
    this.nameAr,
    this.nameEn,
    this.countryId,
    this.regionId,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  Town.fromJson(dynamic json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    countryId = json['countryId'];
    regionId = json['regionId'];
    cityId = json['cityId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
