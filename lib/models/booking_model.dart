import 'package:bobawithflutter/models/facility_model_amu.dart';
import 'package:bobawithflutter/models/get_user_model.dart';

class BookingModel {
  late int? id;
  late String? date;
  late String? start_time;
  late String? end_time;
  late String? status;
  late FacilityModelAmu? facility;
  late GetUserModel? user;

  BookingModel({
    this.id,
    this.date,
    this.start_time,
    this.end_time,
    this.status,
    this.facility,
    this.user,
  });

  BookingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    start_time = json['start_time'];
    end_time = json['end_time'];
    status = json['status'];
    facility = FacilityModelAmu.fromJson(json['facility']);
    user = GetUserModel.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'start_time': start_time,
      'end_time': end_time,
      'status': status,
      'facility': facility!.toJson(),
      'user': user!.toJson(),
    };
  }
}
