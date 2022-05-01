
class City {
  City({
    this.id,
    this.name,
    this.enName,
    this.sorting,
    this.isActive,
    this.countryId,
  });

  int? id;
  String? name;
  String? enName;
  int? sorting;
  int? isActive;
  int? countryId;


  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    enName: json["en_name"],
    sorting: json["sorting"],
    isActive: json["is_active"],
    countryId: json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "en_name": enName,
    "sorting": sorting,
    "is_active": isActive,
    "country_id": countryId,
  };
}
