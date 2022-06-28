import 'package:bobawithflutter/models/booking_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingService {
  String baseUrl = 'https://bobawithflutter.madee.my.id/api';
  Future<List<BookingModel>> getBooking(String token) async {
    var url = '$baseUrl/booking';
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var response = await http.get(url, headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<BookingModel> bookings = [];

      for (var item in data) {
        bookings.add(BookingModel.fromJson(item));
      }

      return bookings;
    } else {
      throw Exception('gagal get bookings');
    }
  }

  Future addBooking({
    required String token,
    required int facility_id,
    required String date,
    required String start_time,
    required String end_time,
  }) async {
    var url = '$baseUrl/booking/create';
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'facility_id': facility_id,
      'date': date,
      'start_time': start_time,
      'end_time': end_time,
    });
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      print(data);
    } else {
      print('gagal add booking');
    }
  }

  Future postApproved({
    required int id,
    required String token,
  }) async {
    var url = '$baseUrl/booking/approved/$id';
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var response = await http.post(url, headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      print(data);
    } else {
      print('gagal approved booking');
    }
  }

  Future postRejected({
    required int id,
    required String token,
  }) async {
    var url = '$baseUrl/booking/rejected/$id';
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var response = await http.post(url, headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      print(data);
    } else {
      print('gagal rejected booking');
    }
  }
}
