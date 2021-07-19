import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/viewmodels/booking_list_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/home_screen_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/login_viewmodel.dart';
import 'package:restaurant_booking_system/router.dart';
import 'package:restaurant_booking_system/viewmodels/register_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/menu_viewmodel.dart';

import 'dependencies.dart' as di;
import 'viewmodels/booking_viewmodel.dart';
import 'viewmodels/order_food_viewmodel.dart';

void main() {
  di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
      ChangeNotifierProvider<MenuViewModel>(create: (_) => MenuViewModel()),
      ChangeNotifierProvider<RegisterViewModel>(
          create: (_) => RegisterViewModel()),
      ChangeNotifierProvider<HomeScreenViewModel>(
          create: (_) => HomeScreenViewModel()),
      ChangeNotifierProvider<BookingListViewModel>(
          create: (_) => BookingListViewModel()),
      ChangeNotifierProvider<BookingViewModel>(
          create: (_) => BookingViewModel()),
      ChangeNotifierProvider<OrderFoodViewModel>(
          create: (_) => OrderFoodViewModel())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Booking System',
      onGenerateRoute: createRoute,
      initialRoute: '/',
    );
  }
}
