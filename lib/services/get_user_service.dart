import 'package:bobawithflutter/models/get_user_model.dart';
import 'package:bobawithflutter/models/user_register_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetUserService {
  String baseUrl = 'https://bobawithflutter.madee.my.id/api';

  Future<List<GetUserModel>> getUser(String token) async {
    var url = '$baseUrl/user';
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var response = await http.get(url, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['users'];
      List<GetUserModel> products = [];

      for (var item in data) {
        products.add(GetUserModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('gagal get User');
    }
  }
}
