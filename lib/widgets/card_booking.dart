import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';

class CardBooking extends StatelessWidget {
  const CardBooking({Key? key}) : super(key: key);

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
                    'Made',
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
                    'Swimming pool',
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
                    '1996-09-23',
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
                    '00:31:46',
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
                    '05:40:59',
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
                    'Waiting Management',
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
