import 'package:bobawithflutter/models/get_user_model.dart';
import 'package:bobawithflutter/services/get_user_service.dart';
import 'package:flutter/cupertino.dart';

class GetUserProvider with ChangeNotifier {
  List<GetUserModel> _user = [];
  List<GetUserModel> get user => _user;

  set user(List<GetUserModel> facility) {
    _user = facility;
    notifyListeners();
  }

  Future<void> getUser(String token) async {
    try {
      List<GetUserModel> facility = await GetUserService().getUser(token);
      _user = facility;
    } catch (err) {
      print(err);
    }
  }
}
