// import 'package:bobawithflutter/models/facility_model_amu.dart';
import 'dart:io';

import 'package:bobawithflutter/models/facility_model_amu.dart';
import 'package:bobawithflutter/services/facility_service.dart';
import 'package:flutter/cupertino.dart';

class FacilityProviderAmu with ChangeNotifier {
  List<FacilityModelAmu> _facilityamu = [];
  List<FacilityModelAmu> get facilityamu => _facilityamu;

  set facility(List<FacilityModelAmu> facility) {
    _facilityamu = facility;
    notifyListeners();
  }

  Future<void> getFacility(String token) async {
    try {
      List<FacilityModelAmu> facility =
          await FacilityService().getFacilityAmu(token);
      _facilityamu = facility;
    } catch (err) {
      print(err);
    }
  }

  Future<bool> addFacility(
      String name, String body, String token, String image) async {
    try {
      if (await FacilityService()
          .addFacility(body: body, name: name, image: image, token: token)) {
        print('berhasil add facility');
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }

  Future<void> deleteFacility(String token, int id) async {
    try {
      await FacilityService().deleteFacility(token: token, id: id);
    } catch (err) {
      print(err);
    }
  }
}
