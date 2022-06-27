import 'package:bobawithflutter/admin/admin_home_page.dart';
import 'package:bobawithflutter/auth/register_page.dart';
import 'package:bobawithflutter/facility/add_facility.dart';
import 'package:bobawithflutter/guest/guest_page.dart';
import 'package:bobawithflutter/management/management_home_page.dart';
import 'package:bobawithflutter/pages/booking_facility.dart';
import 'package:bobawithflutter/pages/facility_detail.dart';
import 'package:bobawithflutter/providers/auth_provider.dart';
import 'package:bobawithflutter/providers/booking_provider.dart';
import 'package:bobawithflutter/providers/facility_provider.dart';
import 'package:bobawithflutter/providers/facility_provider_amu.dart';
import 'package:bobawithflutter/providers/get_user_provider.dart';
import 'package:bobawithflutter/user/user_user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FacilityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FacilityProviderAmu(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetUserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => GuestPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/user/home': (context) => userUserPage(),
          '/facility-detail': (context) => FacilityDetail(),
          '/admin/home': (context) => AdminHomePage(),
          '/management/home': (context) => ManagementHomePage(),
          '/add/facility': (context) => AddFacility(),
          '/booking/facility': (context) => BookingFacility(),
        },
      ),
    );
  }
}
