import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/customer/menu/view_menu/view_menu_screen.dart';
import 'package:restaurant_booking_system/screens/home_screen/home_screen.dart';
import 'package:restaurant_booking_system/screens/login_screen/login_screen.dart';
import 'package:restaurant_booking_system/screens/main_screen/main_screen.dart';
import 'package:restaurant_booking_system/screens/register/register_screen.dart';
import 'package:restaurant_booking_system/screens/splash_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
      return SplashScreen.route();

    case '/main':
      return MainScreen.route();

    case '/login':
      return LoginScreen.route();

    case '/register':
      return RegisterScreen.route();

    case '/menu':
      return MenuScreen.route();

    case '/home':
      return HomeScreen.route();
  }
  return null;
}
