import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/staff/manage_booking/booking_list/booking_list_body.dart';

import 'booking_list_appbar.dart';

class BookingListScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => BookingListScreen());
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: BookingListBar(), body: BookingListBody());
  }
}
