import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/models/booking.dart';
import 'package:restaurant_booking_system/models/user.dart';
import 'package:restaurant_booking_system/screens/home_screen/home_screen_body.dart';
import 'package:restaurant_booking_system/screens/home_screen/profile/profile_screen_body.dart';
import 'package:restaurant_booking_system/screens/home_screen/user_booking_list.dart/user_booking_list.screen.dart';
import 'package:restaurant_booking_system/services/booking_service.dart';

import '../dependencies.dart';

class HomeScreenViewModel extends ChangeNotifier {
  User _user = User();
  List<Booking> userBookings = [];
  int selectedIndex = 0;
  List<Widget> pages = <Widget>[
    HomeScreenBody(),
    UserBookingListScreen(),
    ProfileScreenBody()
  ];

  final bookingService = service<BookingService>();

  User get user => _user;
  set user(value) => _user = value;

  void onTapBottomNav(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<List<Booking>> getUserBookingList(String id) async {
    userBookings = await bookingService.getUserBookingList(_user.id);
    return userBookings;
  }
}
