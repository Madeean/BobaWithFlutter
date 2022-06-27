import 'package:bobawithflutter/models/booking_model.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';

class CardBooking extends StatelessWidget {
  late final BookingModel booking;
  CardBooking(this.booking);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: 15,
        bottom: 15,
      ),
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: primaryTextColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: purpleTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${booking.user!.name}',
                    style: blackTextStyle,
                  )
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Facility',
                    style: purpleTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${booking.facility!.name}',
                    style: blackTextStyle,
                  ),
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: purpleTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${booking.date}',
                    style: blackTextStyle,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start Time',
                    style: purpleTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${booking.start_time}',
                    style: blackTextStyle,
                  )
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'End Time',
                    style: purpleTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${booking.end_time}',
                    style: blackTextStyle,
                  ),
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: purpleTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${booking.status}',
                    style: blackTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
