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
}
