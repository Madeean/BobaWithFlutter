import 'dart:convert';

import 'package:bobawithflutter/models/facility_model.dart';
import 'package:bobawithflutter/models/facility_model_AMU.dart';
import 'package:http/http.dart' as http;

class FacilityService {
  String baseUrl = 'https://bobawithflutter.madee.my.id/api';

  Future<List<FacilityModel>> getFacility() async {
    var url = '$baseUrl/facility';
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<FacilityModel> products = [];

      for (var item in data) {
        products.add(FacilityModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('gagal get Facility');
    }
  }

  Future<List<FacilityModelAmu>> getFacilityAmu(String token) async {
    var url = '$baseUrl/facilityamu';
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var response = await http.get(url, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<FacilityModelAmu> products = [];

      for (var item in data) {
        products.add(FacilityModelAmu.fromJson(item));
      }

      return products;
    } else {
      throw Exception('gagal get Facility');
    }
  }
}
