import 'package:bobawithflutter/models/user_login_model.dart';
import 'package:bobawithflutter/providers/auth_provider.dart';
import 'package:bobawithflutter/providers/booking_provider.dart';
import 'package:bobawithflutter/providers/facility_provider.dart';
import 'package:bobawithflutter/providers/facility_provider_amu.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/user/booking_page_user.dart';
import 'package:bobawithflutter/user/profile_page_user.dart';
import 'package:bobawithflutter/user/user_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class userUserPage extends StatefulWidget {
  const userUserPage({Key? key}) : super(key: key);

  @override
  State<userUserPage> createState() => _userUserPageState();
}

class _userUserPageState extends State<userUserPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    FacilityProviderAmu facilityProviderAmu =
        Provider.of<FacilityProviderAmu>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserLoginModel userLoginModel = authProvider.user;
    BookingProvider bookingProvider = Provider.of<BookingProvider>(context);

    getFacilityHandling() async {
      await facilityProviderAmu.getFacility(userLoginModel.token.toString());
    }

    getBookingHandle() async {
      await bookingProvider.getBookings(userLoginModel.token.toString());
    }
    // PreferredSizeWidget header() {
    //   return AppBar(
    //     elevation: 0,
    //     centerTitle: true,
    //     backgroundColor: backgroundColor2,
    //     automaticallyImplyLeading: false,
    //     title: Text(
    //       'Home Page User',
    //       style: primaryTextStyle.copyWith(
    //         fontSize: 25,
    //       ),
    //     ),
    //   );
    // }

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
                    Icons.holiday_village,
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
                    Icons.bookmark,
                    color: currentIndex == 1 ? primaryColor : Color(0xff808191),
                    size: 30,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Icon(
                    Icons.emoji_people,
                    color: currentIndex == 2 ? primaryColor : Color(0xff808191),
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
          getFacilityHandling();
          return UserHomePage();
          break;
        case 1:
          getBookingHandle();
          return BookingPageUser();
          break;
        case 2:
          return ProfilePageUser();
          break;
        default:
          return UserHomePage();
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
