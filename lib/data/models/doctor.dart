class Doctor {
  Doctor({
    this.id,
    this.name,
    this.phone,
    this.categoryId,
    this.hospital,
  });

  Doctor.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
    categoryId = json['categoryId'];
    hospital = json['hospital'];
  }

  String? id;
  String? name;
  String? phone;
  String? categoryId;
  String? hospital;

  Doctor copyWith({
    String? id,
    String? name,
    String? phone,
    String? categoryId,
    String? hospital,
  }) =>
      Doctor(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        categoryId: categoryId ?? this.categoryId,
        hospital: hospital ?? this.hospital,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['categoryId'] = categoryId;
    map['hospital'] = hospital;
    return map;
  }
}
