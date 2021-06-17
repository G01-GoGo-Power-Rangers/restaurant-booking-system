import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/router.dart';

void main() {
  runApp(MyApp());
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
      // home: MainScreen(),
      onGenerateRoute: createRoute,
      initialRoute: '/',
    );
  }
}
