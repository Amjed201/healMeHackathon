class Timeslot {
  Timeslot({
      this.id, 
      this.num, 
      this.str,});

  Timeslot.fromJson(dynamic json) {
    id = json['_id'];
    num = json['num'];
    str = json['str'];
  }
  String? id;
  int? num;
  String? str;
Timeslot copyWith({  String? id,
  int? num,
  String? str,
}) => Timeslot(  id: id ?? this.id,
  num: num ?? this.num,
  str: str ?? this.str,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['num'] = num;
    map['str'] = str;
    return map;
  }

}