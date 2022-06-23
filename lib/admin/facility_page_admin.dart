import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/widgets/card_facility_admin.dart';
import 'package:flutter/material.dart';

class FacilityPageAdmin extends StatelessWidget {
  const FacilityPageAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: backgroundColor2,
        automaticallyImplyLeading: false,
        title: Text(
          'Facility Admin User',
          style: primaryTextStyle.copyWith(
            fontSize: 25,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        color: backgroundColor3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: defaultMargin,
                bottom: defaultMargin,
              ),
              width: 100,
              height: 50,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Add Facility',
                  style: primaryTextStyle,
                ),
              ),
            ),
            CardFamilyAdmin(),
            CardFamilyAdmin(),
            CardFamilyAdmin(),
            CardFamilyAdmin(),
            CardFamilyAdmin(),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: backgroundColor3,
      body: ListView(
        children: [
          content(),
        ],
      ),
    );
  }
}
