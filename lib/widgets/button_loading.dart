import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: defaultMargin),
        height: 50,
        width: 250,
        child: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    primaryTextColor,
                  ),
                  strokeWidth: 2,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Loading',
                style: primaryTextStyle.copyWith(fontSize: 18),
              ),
            ],
          ),
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
