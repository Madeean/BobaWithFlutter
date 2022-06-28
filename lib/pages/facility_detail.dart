import 'package:bobawithflutter/models/facility_model_amu.dart';
import 'package:bobawithflutter/pages/booking_facility.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';

class FacilityDetail extends StatelessWidget {
  late final FacilityModelAmu facilityModelAmu;
  FacilityDetail(this.facilityModelAmu);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '${facilityModelAmu.name}',
          style: primaryTextStyle.copyWith(
            fontSize: 25,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
            top: 15,
            left: defaultMargin,
            right: defaultMargin,
            bottom: defaultMargin),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(facilityModelAmu.image!),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '${facilityModelAmu.name}',
              style: primaryTextStyle.copyWith(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              '${facilityModelAmu.body}',
              style: primaryTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 75,
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/booking/facility');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookingFacility(facilityModelAmu)));
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  25,
                ),
              ),
            ),
          ),
          child: Text(
            'Booking Now',
            style: primaryTextStyle.copyWith(
              fontSize: 20,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: backgroundColor3,
      bottomNavigationBar: customBottomNav(),
      body: ListView(
        children: [
          content(),
        ],
      ),
    );
  }
}
