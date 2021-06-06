import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/authenticate/authenticate_screen.dart';
import 'package:restaurant_booking_system/screens/home/home_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widget
    return Authenticate();
  }
}
