import 'package:bobawithflutter/models/facility_model.dart';
import 'package:bobawithflutter/services/facility_service.dart';
import 'package:flutter/cupertino.dart';

class FacilityProvider with ChangeNotifier {
  List<FacilityModel> _facility = [];
  List<FacilityModel> get facility => _facility;

  set facility(List<FacilityModel> facility) {
    _facility = facility;
    notifyListeners();
  }

  Future<void> getFacility() async {
    try {
      List<FacilityModel> facility = await FacilityService().getFacility();
      _facility = facility;
    } catch (err) {
      print(err);
    }
  }
}
