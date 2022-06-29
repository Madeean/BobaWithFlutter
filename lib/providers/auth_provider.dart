import 'package:bobawithflutter/models/get_user_model.dart';
import 'package:bobawithflutter/models/user_login_model.dart';
import 'package:bobawithflutter/models/user_register_model.dart';
import 'package:bobawithflutter/services/auth_service.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  late UserLoginModel _user;

  UserLoginModel get user => _user;

  set user(UserLoginModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserRegisterModel user = await AuthService().register(
        name: name,
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      UserLoginModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> deleteUser(String token, int idUser) async {
    try {
      await AuthService().DeleteUser(token: token, idUser: idUser);
    } catch (err) {
      print(err);
    }
  }
}
