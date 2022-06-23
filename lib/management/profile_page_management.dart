import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';

class ProfilePageManagement extends StatelessWidget {
  const ProfilePageManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile Page Management',
          style: primaryTextStyle.copyWith(
            fontSize: 25,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin:
            EdgeInsets.only(top: 40, left: defaultMargin, right: defaultMargin),
        child: Center(
          child: Column(
            children: [
              Text(
                'Hallo, Madee',
                style: primaryTextStyle.copyWith(
                  fontSize: 30,
                  fontWeight: semiBold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Madee@gmail.com',
                style: secondaryTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: Text(
                    'LogOut',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: backgroundColor3,
      body: content(),
    );
  }
}
