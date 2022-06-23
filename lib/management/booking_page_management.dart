import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/widgets/card_booking.dart';
import 'package:bobawithflutter/widgets/card_booking_management.dart';
import 'package:flutter/material.dart';

class BookingPageManagement extends StatelessWidget {
  const BookingPageManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Booking Page Management',
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
            children: [
              CardBookingManagement(),
              CardBookingManagement(),
              CardBookingManagement(),
              CardBookingManagement(),
            ],
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
