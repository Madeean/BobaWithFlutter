import 'package:bobawithflutter/models/user_login_model.dart';
import 'package:bobawithflutter/providers/auth_provider.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePageAdmin extends StatelessWidget {
  const ProfilePageAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserLoginModel userLoginModel = authProvider.user;

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile Page Admin',
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
                'Hallo, ${userLoginModel.name}',
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
                '${userLoginModel.email}',
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
