import 'package:bobawithflutter/models/get_user_model.dart';
import 'package:bobawithflutter/models/user_login_model.dart';
import 'package:bobawithflutter/providers/auth_provider.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardUserAdmin extends StatelessWidget {
  late final GetUserModel getUserModel;
  CardUserAdmin(this.getUserModel);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserLoginModel userLoginModel = authProvider.user;

    deleteUserHandling() async {
      await authProvider.deleteUser(
          userLoginModel.token.toString(), getUserModel.id!.toInt());
      Navigator.pushNamed(context, '/admin/home');
    }

    Future<void> confirmDelete() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Icon(
                    Icons.delete,
                    size: 100,
                    color: primaryTextColor,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Yakin ingin Meng delete?',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item Yang sudah di delete tidak dapat dikembalikan',
                    style: secondaryTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 100,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Batal',
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          child: TextButton(
                            onPressed: deleteUserHandling,
                            style: TextButton.styleFrom(
                              backgroundColor: alertColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Delete',
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
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
        color: subtitleColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: alertTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${getUserModel.name}',
                    style: primaryTextStyle,
                  )
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: alertTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${getUserModel.email}',
                    style: primaryTextStyle,
                  ),
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Role',
                    style: alertTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${getUserModel.role}',
                    style: primaryTextStyle,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 40,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Edit',
                    style: primaryTextStyle,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                height: 40,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    confirmDelete();
                  },
                  child: Text(
                    'Delete',
                    style: primaryTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
