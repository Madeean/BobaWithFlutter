import 'package:bobawithflutter/models/user_login_model.dart';
import 'package:bobawithflutter/providers/auth_provider.dart';
import 'package:bobawithflutter/providers/booking_provider.dart';
import 'package:bobawithflutter/providers/facility_provider_amu.dart';
import 'package:bobawithflutter/providers/get_user_provider.dart';
import 'package:bobawithflutter/theme.dart';
import 'package:bobawithflutter/widgets/button_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    FacilityProviderAmu facilityProviderAmu =
        Provider.of<FacilityProviderAmu>(context);
    GetUserProvider getUserProvider = Provider.of<GetUserProvider>(context);
    BookingProvider bookingProvider = Provider.of<BookingProvider>(context);

    handleLogin() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        UserLoginModel userLoginModel = authProvider.user;
        if (userLoginModel.role.toString() == 'admin') {
          await facilityProviderAmu
              .getFacility(userLoginModel.token.toString());
          await getUserProvider.getUser(userLoginModel.token.toString());
          await bookingProvider.getBookings(userLoginModel.token.toString());
          Navigator.pushNamedAndRemoveUntil(
              context, '/admin/home', (route) => false);
        } else if (userLoginModel.role.toString() == 'management') {
          await bookingProvider.getBookings(userLoginModel.token.toString());
          await facilityProviderAmu
              .getFacility(userLoginModel.token.toString());
          Navigator.pushNamedAndRemoveUntil(
              context, '/management/home', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/user/home', (route) => false);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            backgroundColor: alertColor,
            content: Text(
              'Gagal Login',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Login Page',
          style: primaryTextStyle.copyWith(
            fontSize: 25,
          ),
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin, bottom: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        autocorrect: true,
                        controller: emailController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 12, bottom: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_password.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        autocorrect: true,
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your password',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget button() {
      return Column(
        children: [
          Container(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: defaultMargin),
                height: 50,
                width: 250,
                child: TextButton(
                  onPressed: handleLogin,
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, '/user/home', (route) => false);
                  child: Text(
                    'Login',
                    style: primaryTextStyle.copyWith(fontSize: 18),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Text(
                  'Blum punya akun?',
                  style: primaryTextStyle,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: header(),
      backgroundColor: backgroundColor1,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                emailInput(),
                passwordInput(),
                isLoading ? ButtonLoading() : button(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
