import 'package:bobawithflutter/models/get_user_model.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';

class CardUserAdmin extends StatelessWidget {
  late final GetUserModel getUserModel;
  CardUserAdmin(this.getUserModel);

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
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
