import 'package:bobawithflutter/models/get_user_model.dart';
import 'package:bobawithflutter/models/user_login_model.dart';
import 'package:bobawithflutter/models/user_register_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  String baseUrl = 'https://bobawithflutter.madee.my.id/api';

  Future<UserRegisterModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      UserRegisterModel user = UserRegisterModel.fromJson(data);
      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserLoginModel> login({
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserLoginModel user = UserLoginModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future DeleteUser({
    required String token,
    required int idUser,
  }) async {
    var url = '$baseUrl/user/$idUser';
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
