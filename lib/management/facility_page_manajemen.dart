import 'package:bobawithflutter/providers/facility_provider_amu.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/widgets/card_facility_admin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FacilityPageManagement extends StatefulWidget {
  const FacilityPageManagement({Key? key}) : super(key: key);

  @override
  State<FacilityPageManagement> createState() => _FacilityPageManagementState();
}

class _FacilityPageManagementState extends State<FacilityPageManagement> {
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
          'Facility Admin Management',
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
                onPressed: () {
                  Navigator.pushNamed(context, '/add/facility');
                },
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
            Column(
              children: facilityProviderAmu.facilityamu
                  .map((facility) => CardFamilyAdmin(facility))
                  .toList(),
            ),
            // CardFamilyAdmin(),
            // CardFamilyAdmin(),
            // CardFamilyAdmin(),
            // CardFamilyAdmin(),
            // CardFamilyAdmin(),
          ],
        ),
      );
    }

    Widget loading() {
      return Container(
        margin: EdgeInsets.only(top: 202),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Container(
            width: 16,
            height: 16,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                primaryTextColor,
              ),
              strokeWidth: 2,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: backgroundColor3,
      body: ListView(
        children: [
          facilityProviderAmu.facilityamu.length == 0 ? loading() : content(),
        ],
      ),
    );
  }
}
