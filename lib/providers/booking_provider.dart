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
}
