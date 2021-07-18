import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/screens/main_screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  static Route route({user}) =>
      MaterialPageRoute(builder: (context) => SplashScreen());

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacement(context, MainScreen.route()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.jpg',
              semanticLabel: 'Umie Ju Corner Logo',
              height: 170.0,
            ),
          )
        ],
      ),
    );
  }
}
