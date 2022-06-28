import 'package:bobawithflutter/models/booking_model.dart';
import 'package:bobawithflutter/pages/booking_booking_page.dart';
import 'package:bobawithflutter/providers/booking_provider.dart';
import 'package:bobawithflutter/providers/facility_provider_amu.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/widgets/card_booking.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingPageUser extends StatelessWidget {
  const BookingPageUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookingProvider bookingProvider = Provider.of<BookingProvider>(context);
    FacilityProviderAmu facilityProviderAmu =
        Provider.of<FacilityProviderAmu>(context);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 50,
                margin: EdgeInsets.all(defaultMargin),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BookingBookingPage(facilityProviderAmu)));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add Booking',
                    style: primaryTextStyle,
                  ),
                ),
              ),
            ],
          ),
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
