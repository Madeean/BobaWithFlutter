import 'package:bobawithflutter/models/facility_model_AMU.dart';
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
}
