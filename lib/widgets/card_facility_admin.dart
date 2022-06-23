import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';

class CardFamilyAdmin extends StatelessWidget {
  const CardFamilyAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: defaultMargin),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffECEDEF),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/image_shoes.png',
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Swimming Pool',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'lets booking swimming pool',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 58,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/facility-detail');
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          child: Text(
                            'Detail',
                            style: primaryTextStyle,
                          ),
                        ),
                      ),
                      Container(
                        width: 58,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/facility-detail');
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          child: Text(
                            'Edit',
                            style: primaryTextStyle,
                          ),
                        ),
                      ),
                      Container(
                        width: 65,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/facility-detail');
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: alertColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
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
            ),
          ),
        ],
      ),
    );
  }
}
