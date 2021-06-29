import 'package:flutter/material.dart';

class HomeScreenViewModel extends ChangeNotifier {
  int selectedIndex = 0;

  void onTapBottomNav(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
