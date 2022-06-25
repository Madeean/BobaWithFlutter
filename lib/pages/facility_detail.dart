import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';

class FacilityDetail extends StatelessWidget {
  const FacilityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Swimming Pool',
          style: primaryTextStyle.copyWith(
            fontSize: 25,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
            top: 15,
            left: defaultMargin,
            right: defaultMargin,
            bottom: defaultMargin),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset('assets/image_shoes.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Swimming Pool',
              style: primaryTextStyle.copyWith(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
              style: primaryTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 75,
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/booking/facility');
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  25,
                ),
              ),
            ),
          ),
          child: Text(
            'Booking Now',
            style: primaryTextStyle.copyWith(
              fontSize: 20,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: backgroundColor3,
      bottomNavigationBar: customBottomNav(),
      body: ListView(
        children: [
          content(),
        ],
      ),
    );
  }
}
