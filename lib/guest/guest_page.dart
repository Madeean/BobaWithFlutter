import 'package:bobawithflutter/auth/login_page.dart';
import 'package:bobawithflutter/guest/home_guest_page.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:flutter/material.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget CustomBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(defaultMargin),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
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
                    Icons.home,
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
                    Icons.login,
                    color: currentIndex == 1 ? primaryColor : Color(0xff808191),
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
          return HomeGuestPage();
          break;
        case 1:
          return LoginPage();
          break;
        default:
          return HomeGuestPage();
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNav(),
      body: body(),
    );
  }
}
