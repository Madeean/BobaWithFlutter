import 'package:bobawithflutter/models/facility_model_amu.dart';
import 'package:bobawithflutter/models/user_login_model.dart';
import 'package:bobawithflutter/pages/facility_detail.dart';
import 'package:bobawithflutter/providers/auth_provider.dart';
import 'package:bobawithflutter/providers/facility_provider_amu.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';

class CardFamilyAdmin extends StatelessWidget {
  late final FacilityModelAmu facilityModelAmu;
  CardFamilyAdmin(this.facilityModelAmu);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserLoginModel userLoginModel = authProvider.user;
    FacilityProviderAmu facilityProviderAmu =
        Provider.of<FacilityProviderAmu>(context);

    String _parseHtmlString(String htmlString) {
      final document = parse(htmlString);
      final String parsedString =
          parse(document.body.text).documentElement.text;

      return parsedString;
    }

    deleteUserHandling() async {
      await facilityProviderAmu.deleteFacility(
          userLoginModel.token.toString(), facilityModelAmu.id!.toInt());

      Navigator.pop(context);
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
            child: Image.network(
              facilityModelAmu.image!,
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
                    '${facilityModelAmu.name}',
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
                    _parseHtmlString(facilityModelAmu.body.toString()),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FacilityDetail(facilityModelAmu)));
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
                          onPressed: () {},
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
                            confirmDelete();
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
