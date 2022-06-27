import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/widgets/card_booking.dart';
import 'package:flutter/material.dart';

class BookingPageUser extends StatelessWidget {
  const BookingPageUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
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
            children: [
              // CardBooking(),
              // CardBooking(),
              // CardBooking(),
              // CardBooking(),
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
