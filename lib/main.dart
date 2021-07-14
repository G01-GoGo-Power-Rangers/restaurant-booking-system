import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/viewmodels/booking_list_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/home_screen_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/login_viewmodel.dart';
import 'package:restaurant_booking_system/router.dart';
import 'package:restaurant_booking_system/viewmodels/register_viewmodel.dart';
import 'package:restaurant_booking_system/viewmodels/view_menu_viewmodel.dart';

import 'dependencies.dart' as di;
import 'viewmodels/booking_viewmodel.dart';
import 'viewmodels/order_menu_viewmodel.dart';

void main() {
  di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ChangeNotifierProvider(create: (_) => RegisterViewModel()),
      ChangeNotifierProvider(create: (_) => ViewMenuViewModel()),
      ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
      ChangeNotifierProvider(create: (_) => BookingListViewModel()),
      ChangeNotifierProvider(create: (_) => BookingViewModel()),
      ChangeNotifierProvider(create: (_) => OrderMenuViewModel())
    ],
    child: MyApp(),
  ));
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Booking System',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      onGenerateRoute: createRoute,
      initialRoute: '/',
    );
  }
}
