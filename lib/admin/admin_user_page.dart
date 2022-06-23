import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/widgets/card_user_for_admin.dart';
import 'package:flutter/material.dart';

class AdminUserPage extends StatelessWidget {
  const AdminUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor2,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Admin User Page',
          style: primaryTextStyle.copyWith(
            fontSize: 25,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                      'Add User',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CardUserAdmin(),
                CardUserAdmin(),
                CardUserAdmin(),
                CardUserAdmin(),
              ],
            ),
          ],
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
