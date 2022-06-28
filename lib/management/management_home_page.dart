import 'package:bobawithflutter/management/booking_page_management.dart';
import 'package:bobawithflutter/management/facility_page_manajemen.dart';
import 'package:bobawithflutter/management/profile_page_management.dart';
import 'package:bobawithflutter/models/user_login_model.dart';
import 'package:bobawithflutter/providers/auth_provider.dart';
import 'package:bobawithflutter/providers/booking_provider.dart';
import 'package:bobawithflutter/providers/facility_provider_amu.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManagementHomePage extends StatefulWidget {
  const ManagementHomePage({Key? key}) : super(key: key);

  @override
  State<ManagementHomePage> createState() => _ManagementHomePageState();
}

class _ManagementHomePageState extends State<ManagementHomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserLoginModel userLoginModel = authProvider.user;
    FacilityProviderAmu facilityProviderAmu =
        Provider.of<FacilityProviderAmu>(context);

    BookingProvider bookingProvider = Provider.of<BookingProvider>(context);

    getBookingHandling() async {
      await bookingProvider.getBookings(userLoginModel.token.toString());
    }

    gefacilityamuHandling() async {
      await facilityProviderAmu.getFacility(userLoginModel.token.toString());
    }

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
          gefacilityamuHandling();
          return FacilityPageManagement();
          break;
        case 1:
          getBookingHandling();
          return BookingPageManagement();
          break;
        case 2:
          return ProfilePageManagement();
          break;
        default:
          return FacilityPageManagement();
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
