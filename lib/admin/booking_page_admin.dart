import 'package:bobawithflutter/models/booking_model.dart';
import 'package:bobawithflutter/providers/booking_provider.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/widgets/card_booking.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingPageAdmin extends StatefulWidget {
  const BookingPageAdmin({Key? key}) : super(key: key);

  @override
  State<BookingPageAdmin> createState() => _BookingPageAdminState();
}

class _BookingPageAdminState extends State<BookingPageAdmin> {
  @override
  Widget build(BuildContext context) {
    BookingProvider bookingProvider = Provider.of<BookingProvider>(context);
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Booking Page User',
          style: primaryTextStyle.copyWith(
            fontSize: 25,
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        children: [
          Column(
            children: bookingProvider.bookings
                .map((booking) => CardBooking(booking))
                .toList(),
            // CardBooking(),
            // CardBooking(),
            // CardBooking(),
            // CardBooking(),
          )
        ],
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: backgroundColor3,
      body: content(),
    );
  }
}
