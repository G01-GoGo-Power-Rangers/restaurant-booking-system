import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/authenticate/login_screen.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoginScreen(),
    );
  }
}
