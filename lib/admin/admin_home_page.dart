import 'package:bobawithflutter/admin/admin_user_page.dart';
import 'package:bobawithflutter/admin/booking_page_admin.dart';
import 'package:bobawithflutter/admin/facility_page_admin.dart';
import 'package:bobawithflutter/admin/profile_page_admin.dart';
import 'package:bobawithflutter/models/facility_model_AMU.dart';
import 'package:bobawithflutter/models/user_login_model.dart';
import 'package:bobawithflutter/providers/auth_provider.dart';
import 'package:bobawithflutter/providers/facility_provider_amu.dart';
import 'package:bobawithflutter/providers/get_user_provider.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserLoginModel userLoginModel = authProvider.user;
    FacilityProviderAmu facilityProviderAmu =
        Provider.of<FacilityProviderAmu>(context);
    GetUserProvider getUserProvider = Provider.of<GetUserProvider>(context);

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(defaultMargin),
        ),
        child: BottomAppBar(
          // shape: CircularNotchedRectangle(),
          // notchMargin: 10,
          // clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Icon(
                    Icons.people,
                    color: currentIndex == 0 ? primaryColor : Color(0xff808191),
                    size: 30,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Icon(
                    Icons.holiday_village,
                    color: currentIndex == 1 ? primaryColor : Color(0xff808191),
                    size: 30,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Icon(
                      Icons.bookmark,
                      color:
                          currentIndex == 2 ? primaryColor : Color(0xff808191),
                      size: 30,
                    ),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Icon(
                    Icons.emoji_people,
                    color: currentIndex == 3 ? primaryColor : Color(0xff808191),
                    size: 30,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return AdminUserPage();
          break;
        case 1:
          return FacilityPageAdmin();
          break;
        case 2:
          return BookingPageAdmin();
          break;
        case 3:
          return ProfilePageAdmin();
          break;
        default:
          return AdminUserPage();
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      bottomNavigationBar: customBottomNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: body(),
    );
  }
}
