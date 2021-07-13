<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/customer/booking/booking_appbar.dart';
import 'package:restaurant_booking_system/screens/customer/booking/booking_body.dart';

class BookingScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => BookingScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingAppBar(),
      body: BookingBody(),
    );
  }
}
=======

>>>>>>> 6650c59c6035b594b6e0bcce9c7847415aa73ca3
