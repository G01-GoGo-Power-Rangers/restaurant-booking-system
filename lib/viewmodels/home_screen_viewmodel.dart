import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/home_screen/home_screen_body.dart';
import 'package:restaurant_booking_system/screens/home_screen/profile/profile_screen_body.dart';
import 'package:restaurant_booking_system/screens/home_screen/user_booking_list.dart/user_booking_list.screen.dart';

class HomeScreenViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  List<Widget> pages = <Widget>[
    HomeScreenBody(),
    UserBookingListScreen(),
    ProfileScreenBody()
  ];

  void onTapBottomNav(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
