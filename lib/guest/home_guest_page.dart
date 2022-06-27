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
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState

    getInit();

    // NOTE: TIMER
    // Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/sign-in'));

    super.initState();
  }

  getInit() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<FacilityProvider>(context, listen: false).getFacility();
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    FacilityProvider facilityProvider = Provider.of<FacilityProvider>(context);

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
          isLoading ? loading() : content(),
        ],
      ),
    );
  }
}
