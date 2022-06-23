import 'package:bobawithflutter/admin/admin_home_page.dart';
import 'package:bobawithflutter/auth/register_page.dart';
import 'package:bobawithflutter/guest/guest_page.dart';
import 'package:bobawithflutter/management/management_home_page.dart';
import 'package:bobawithflutter/pages/facility_detail.dart';
import 'package:bobawithflutter/user/user_user_page.dart';
import 'package:flutter/material.dart';

import 'auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => GuestPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/user/home': (context) => userUserPage(),
        '/facility-detail': (context) => FacilityDetail(),
        '/admin/home': (context) => AdminHomePage(),
        '/management/home': (context) => ManagementHomePage(),
      },
    );
  }
}
