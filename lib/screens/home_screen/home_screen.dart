import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/screens/home_screen/home_screen_body.dart';
import 'package:restaurant_booking_system/screens/home_screen/home_screen_bottomnav.dart';

class HomeScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (context) => HomeScreen());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(),
          backgroundColor: kPrimaryColorDark,
        ),
        body: HomeScreenBody(),
        bottomNavigationBar: HomeBottomNav(),
      ),
    );
  }
}
