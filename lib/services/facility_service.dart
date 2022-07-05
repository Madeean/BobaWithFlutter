import 'dart:convert';
import 'dart:io';

import 'package:bobawithflutter/models/facility_model.dart';
import 'package:bobawithflutter/models/facility_model_amu.dart';
import 'package:bobawithflutter/providers/facility_provider_amu.dart';
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

  Future<bool> addFacility(
      {required String body,
      required String name,
      required String image,
      required String token}) async {
    var url = '$baseUrl/facility/create';
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
      'Authorization': token,
    };
    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['body'] = body
      ..fields['name'] = name
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', image));
    var response = await request.send();
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> editFacillity({
    required String token,
    required String name,
    required String body,
    String? image,
    required int id,
  }) async {
    var url = '$baseUrl/facility/edit/$id';
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
      'Authorization': token,
    };
    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['body'] = body
      ..fields['name'] = name
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', image));
    var response = await request.send();
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> editFacillitygadaGambar({
    required String token,
    required String name,
    required String bodyy,
    required int id,
  }) async {
    var url = '$baseUrl/facility/edit/$id';
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    Map data = {
      "name": name,
      "body": bodyy,
    };

    var body = jsonEncode(data);
    print(body);
    var response = await http.post(url, headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('gagal get Facility');
    }
  }

  Future deleteFacility({
    required String token,
    required int id,
  }) async {
    var url = '$baseUrl/facility/$id';
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var response = await http.post(
      url,
      headers: headers,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    } else {
      print('gagal delete user');
    }
  }
}
