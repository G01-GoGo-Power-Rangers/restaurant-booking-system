import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/screens/home_screen/profile/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => ProfileScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(),
          backgroundColor: kPrimaryColor,
        ),
        body: ProfileScreenBody());
  }
}
