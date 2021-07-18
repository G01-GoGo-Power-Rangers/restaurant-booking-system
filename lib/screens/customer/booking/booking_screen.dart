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
