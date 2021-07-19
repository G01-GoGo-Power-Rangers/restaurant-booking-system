import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/models/booking.dart';
import 'package:restaurant_booking_system/screens/customer/booking/booking_screen.dart';
import 'package:restaurant_booking_system/screens/customer/menu/view_menu/view_menu_screen.dart';
import 'package:restaurant_booking_system/screens/customer/order_food/order_food_screen.dart';
import 'package:restaurant_booking_system/screens/home_screen/home_screen.dart';
import 'package:restaurant_booking_system/screens/login_screen/login_screen.dart';
import 'package:restaurant_booking_system/screens/main_screen/main_screen.dart';
import 'package:restaurant_booking_system/screens/register/register_screen.dart';
import 'package:restaurant_booking_system/screens/splash_screen.dart';
import 'package:restaurant_booking_system/screens/staff/manage_booking/booking_details/booking_details_screen.dart';

import 'screens/customer/menu/cart/cart_screen.dart';
import 'screens/customer/menu/order_menu/order_menu_screen.dart';
import 'widget/order_success_screen.dart';
import 'screens/staff/manage_booking/booking_list/booking_list_screen.dart';
import 'widget/register_success.dart';

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

    case '/ordermenu':
      return OrderMenuScreen.route();

    case '/home':
      return HomeScreen.route();

    case '/book':
      return BookingScreen.route();

    case '/booklist':
      return BookingListScreen.route();

    case '/bookdetails':
      return BookingDetailsScreen.route(booking: settings.arguments as Booking);

    case '/orderfood':
      return OrderFoodScreen.route();

    case '/cart':
      return CartScreen.route();

    case '/ordersuccess':
      return OrderSuccessScreen.route();

    case '/registersuccess':
      return RegisterSuccessScreen.route();
  }
  return null;
}
