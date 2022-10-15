class User {
  User({
      this.name, 
      this.email, 
      this.phone, 
      this.gender, 
      this.age, 
      this.id,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    age = json['age'];
    id = json['id'];
  }
  String? name;
  String? email;
  String? phone;
  String? gender;
  var age;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['gender'] = gender;
    map['age'] = age;
    map['id'] = id;
    return map;
  }

}