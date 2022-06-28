import 'package:bobawithflutter/models/booking_model.dart';
import 'package:bobawithflutter/services/booking_service.dart';
import 'package:flutter/cupertino.dart';

class BookingProvider with ChangeNotifier {
  List<BookingModel> _bookings = [];
  List<BookingModel> get bookings => _bookings;

  set bookings(List<BookingModel> bookings) {
    _bookings = bookings;
    notifyListeners();
  }

  Future<void> getBookings(String token) async {
    try {
      List<BookingModel> bookings = await BookingService().getBooking(token);
      _bookings = bookings;
    } catch (err) {
      print(err);
    }
  }

  Future<void> addBooking(
    String token,
    int facility_id,
    String date,
    String start_time,
    String end_time,
  ) async {
    try {
      await BookingService().addBooking(
          token: token,
          facility_id: facility_id,
          date: date,
          start_time: start_time,
          end_time: end_time);
    } catch (err) {
      print(err);
    }
  }

  Future<void> postApproved(int id, String token) async {
    try {
      await BookingService().postApproved(id: id, token: token);
    } catch (err) {
      print(err);
    }
  }

  Future<void> postRejected(int id, String token) async {
    try {
      await BookingService().postRejected(id: id, token: token);
    } catch (err) {
      print(err);
    }
  }
}
