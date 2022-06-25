import 'package:flutter/cupertino.dart';

class FacilityModel {
  late int? id;
  late String? name;
  late String? image;
  late String? body;
  late DateTime? created_at;
  late DateTime? updated_at;

  FacilityModel({
    this.id,
    this.name,
    this.image,
    this.body,
    this.created_at,
    this.updated_at,
  });

  FacilityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    body = json['body'];
    created_at = DateTime.parse(json['created_at']);
    updated_at = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'body': body,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }
}
