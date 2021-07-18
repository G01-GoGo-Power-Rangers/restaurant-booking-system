import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/viewmodels/home_screen_viewmodel.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    Key key,
    @required this.homeScreenViewModel,
  }) : super(key: key);

  final HomeScreenViewModel homeScreenViewModel;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 20,
      backgroundColor: kPrimaryColorDark,
      currentIndex: homeScreenViewModel.selectedIndex,
      onTap: (index) => homeScreenViewModel.onTapBottomNav(index),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
      selectedFontSize: 17,
      unselectedFontSize: 15,
      selectedIconTheme: IconThemeData(size: 40),
      iconSize: 37,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded), label: 'Booking'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded), label: 'Profile'),
      ],
    );
  }
}
