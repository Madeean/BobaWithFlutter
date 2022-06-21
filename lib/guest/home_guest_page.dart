import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/widgets/card_home_guest.dart';
import 'package:flutter/material.dart';

class HomeGuestPage extends StatelessWidget {
  const HomeGuestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          children: [
            CardHomeGuest(
              isButton: false,
            ),
            CardHomeGuest(isButton: false),
            CardHomeGuest(isButton: false),
            CardHomeGuest(isButton: false),
            CardHomeGuest(isButton: false),
          ],
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
