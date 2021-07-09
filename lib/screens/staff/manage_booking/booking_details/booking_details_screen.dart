import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/staff/manage_booking/booking_details/booking_details_appbar.dart';
import 'package:restaurant_booking_system/screens/staff/manage_booking/booking_details/booking_details_body.dart';

class BookingDetailsScreen extends StatelessWidget
    implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(60.0);
  const BookingDetailsScreen({Key key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (context) => BookingDetailsScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingDetailsAppBar(),
      body: BookingDetailsBody(),
    );
  }
}
