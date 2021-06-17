import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/login_screen/login_screen_body.dart';
import 'package:restaurant_booking_system/constant.dart';

class LoginScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
      ),
      body: LoginScreenBody(),
    );
  }
}
