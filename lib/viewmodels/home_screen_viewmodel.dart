import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/home_screen/home_screen_body.dart';
import 'package:restaurant_booking_system/screens/home_screen/profile/profile_screen_body.dart';

class HomeScreenViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  List<Widget> pages = <Widget>[HomeScreenBody(), ProfileScreenBody()];

  void onTapBottomNav(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
