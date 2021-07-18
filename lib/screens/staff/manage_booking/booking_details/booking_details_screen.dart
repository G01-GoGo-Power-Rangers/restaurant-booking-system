import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/models/booking.dart';
import 'package:restaurant_booking_system/screens/staff/manage_booking/booking_details/booking_details_appbar.dart';
import 'package:restaurant_booking_system/screens/staff/manage_booking/booking_details/booking_details_body.dart';
import 'package:restaurant_booking_system/widget/drawer_widget.dart';

class BookingDetailsScreen extends StatelessWidget {
  final Booking _booking;

  get booking => _booking;

  BookingDetailsScreen({Booking booking}) : _booking = booking;

  static Route route({Booking booking}) => MaterialPageRoute(
      builder: (context) => BookingDetailsScreen(booking: booking));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingDetailsAppBar(),
      body: BookingDetailsBody(booking: booking),
      drawer: CustomDrawer(),
    );
  }
}
