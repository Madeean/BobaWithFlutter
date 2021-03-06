import 'package:bobawithflutter/providers/facility_provider_amu.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/widgets/card_facility_user.dart';
import 'package:bobawithflutter/widgets/card_home_guest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FacilityProviderAmu facilityProviderAmu =
        Provider.of<FacilityProviderAmu>(context);

    PreferredSizeWidget header() {
      return AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: backgroundColor2,
        automaticallyImplyLeading: false,
        title: Text(
          'Facility Page User',
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
          children: facilityProviderAmu.facilityamu
              .map((facility) => CardFacilityUser(facility))
              .toList(),
          // CardHomeGuest(
          //   isButton: true,
          // ),
          // CardHomeGuest(isButton: true),
          // CardHomeGuest(isButton: true),
          // CardHomeGuest(isButton: true),
          // CardHomeGuest(isButton: true),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: ListView(
        children: [
          content(),
        ],
      ),
    );
  }
}
