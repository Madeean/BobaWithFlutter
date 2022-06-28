import 'package:bobawithflutter/models/booking_model.dart';
import 'package:bobawithflutter/models/user_login_model.dart';
import 'package:bobawithflutter/providers/auth_provider.dart';
import 'package:bobawithflutter/providers/booking_provider.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardBookingManagement extends StatefulWidget {
  late final BookingModel bookingModel;
  CardBookingManagement(this.bookingModel);

  @override
  State<CardBookingManagement> createState() => _CardBookingManagementState();
}

class _CardBookingManagementState extends State<CardBookingManagement> {
  var ACC = false;
  var REJ = false;
  var WAIT = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserLoginModel userLoginModel = authProvider.user;
    BookingProvider bookingProvider = Provider.of<BookingProvider>(context);

    ApprovedHandling() async {
      await bookingProvider.postApproved(
          widget.bookingModel.id!.toInt(), userLoginModel.token.toString());

      Navigator.pushNamed(context, '/management/home');
    }

    RejectedHandling() async {
      await bookingProvider.postRejected(
          widget.bookingModel.id!.toInt(), userLoginModel.token.toString());

      Navigator.pushNamed(context, '/management/home');
    }

    Widget cekbutton() {
      if (widget.bookingModel.status == "Waiting Management") {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              width: 125,
              child: TextButton(
                onPressed: ApprovedHandling,
                style: TextButton.styleFrom(
                    backgroundColor: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: Text(
                  'Accept',
                  style: primaryTextStyle,
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(top: 10),
              width: 125,
              child: TextButton(
                onPressed: RejectedHandling,
                style: TextButton.styleFrom(
                    backgroundColor: alertColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: Text(
                  'Reject',
                  style: primaryTextStyle,
                ),
              ),
            ),
          ],
        );
      } else if (widget.bookingModel.status == "Approved") {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              width: 125,
              child: TextButton(
                onPressed: RejectedHandling,
                style: TextButton.styleFrom(
                    backgroundColor: alertColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: Text(
                  'Reject',
                  style: primaryTextStyle,
                ),
              ),
            ),
          ],
        );
      } else {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              width: 125,
              child: TextButton(
                onPressed: ApprovedHandling,
                style: TextButton.styleFrom(
                    backgroundColor: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: Text(
                  'Accept',
                  style: primaryTextStyle,
                ),
              ),
            ),
          ],
        );
      }
    }

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
                    '${widget.bookingModel.user!.name}',
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
                    '${widget.bookingModel.facility!.name}',
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
                    '${widget.bookingModel.date}',
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
                    '${widget.bookingModel.start_time}',
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
                    '${widget.bookingModel.end_time}',
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
                    '${widget.bookingModel.status}',
                    style: blackTextStyle,
                  ),
                ],
              ),
            ],
          ),
          cekbutton()
        ],
      ),
    );
  }
}
