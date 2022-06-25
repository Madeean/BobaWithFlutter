import 'package:bobawithflutter/providers/facility_provider.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/widgets/card_home_guest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeGuestPage extends StatefulWidget {
  const HomeGuestPage({Key? key}) : super(key: key);

  @override
  State<HomeGuestPage> createState() => _HomeGuestPageState();
}

class _HomeGuestPageState extends State<HomeGuestPage> {
  @override
  void initState() {
    // TODO: implement initState

    getInit();

    // NOTE: TIMER
    // Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/sign-in'));

    super.initState();
  }

  getInit() async {
    await Provider.of<FacilityProvider>(context, listen: false).getFacility();
  }

  Widget build(BuildContext context) {
    FacilityProvider facilityProvider = Provider.of<FacilityProvider>(context);

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Home Page',
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
          children: facilityProvider.facility
              .map((facility) => CardHomeGuest(false, facility))
              .toList(),
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
