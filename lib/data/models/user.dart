

class User {
  User({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.countryCode,
    this.email,
    this.profilePictureUrl,
    this.password,
    this.status,
    this.registeredAt,
    this.role,
    this.blockNotes,
  });

  int? id;
  String? fullName;
  String? phoneNumber;
  String? countryCode;
  String? email;
  String? profilePictureUrl;
  String? password;
  String? status;
  String? registeredAt;
  String? role;
  String? blockNotes;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullName: json["fullName"],
    phoneNumber: json["phoneNumber"],
    countryCode: json["countryCode"],
    email: json["email"],
    profilePictureUrl: json["profilePictureUrl"],
    password: json["password"],
    status: json["status"],
    registeredAt: json["registeredAt"],
    role: json["role"],
    blockNotes: json["blockNotes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "phoneNumber": phoneNumber,
    "countryCode": countryCode,
    "email": email,
    "profilePictureUrl": profilePictureUrl,
    "password": password,
    "status": status,
    "registeredAt": registeredAt,
    "role": role,
    "blockNotes": blockNotes,
  };
}
