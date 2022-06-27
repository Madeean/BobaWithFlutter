import 'package:bobawithflutter/providers/get_user_provider.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/widgets/card_user_for_admin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminUserPage extends StatefulWidget {
  const AdminUserPage({Key? key}) : super(key: key);

  @override
  State<AdminUserPage> createState() => _AdminUserPageState();
}

class _AdminUserPageState extends State<AdminUserPage> {
  @override
  Widget build(BuildContext context) {
    GetUserProvider getUserProvider = Provider.of<GetUserProvider>(context);

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
                Column(
                  children: getUserProvider.user
                      .map((user) => CardUserAdmin(user))
                      .toList(),
                ),
                // CardUserAdmin(),
                // CardUserAdmin(),
                // CardUserAdmin(),
                // CardUserAdmin(),
              ],
            ),
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
      body: getUserProvider.user.isEmpty ? loading() : content(),
    );
  }
}
