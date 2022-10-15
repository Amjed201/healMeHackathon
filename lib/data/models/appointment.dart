import 'package:healMe/data/models/category.dart';

class Appointment {
  Appointment({
    this.id,
    this.patientId,
    this.category,
    this.timeslot,
  });

  Appointment.fromJson(dynamic json) {
    id = json['_id'];
    patientId = json['patientId'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    timeslot =
        json['timeslot'] != null ? Timeslot.fromJson(json['timeslot']) : null;
  }

  String? id;
  String? patientId;
  Category? category;
  Timeslot? timeslot;

  Appointment copyWith({
    String? id,
    String? patientId,
    Category? category,
    Timeslot? timeslot,
  }) =>
      Appointment(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        category: category ?? this.category,
        timeslot: timeslot ?? this.timeslot,
      );


}

class Timeslot {
  Timeslot({
    this.num,
    this.str,
  });

  Timeslot.fromJson(dynamic json) {
    num = json['num'];
    str = json['str'];
  }

  int? num;
  String? str;

  Timeslot copyWith({
    int? num,
    String? str,
  }) =>
      Timeslot(
        num: num ?? this.num,
        str: str ?? this.str,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['num'] = num;
    map['str'] = str;
    return map;
  }
}
