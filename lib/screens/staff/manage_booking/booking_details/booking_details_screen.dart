import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/models/booking.dart';
import 'package:restaurant_booking_system/screens/staff/manage_booking/booking_details/booking_details_appbar.dart';
import 'package:restaurant_booking_system/screens/staff/manage_booking/booking_details/booking_details_body.dart';
import 'package:restaurant_booking_system/widget/drawer_widget.dart';

class BookingDetailsScreen extends StatelessWidget
    implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(60.0);
  Booking _data;
  get data => _data;

  BookingDetailsScreen({Key key, Booking data})
      : _data = data,
        super(key: key);
  static Route route({isEditing = true, data}) =>
      MaterialPageRoute(builder: (context) => BookingDetailsScreen(data: data));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingDetailsAppBar(),
      body: BookingDetailsBody(state: data),
      drawer: DrawerCustom(''),
    );
  }
}
