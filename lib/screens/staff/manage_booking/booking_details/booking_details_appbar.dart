import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/constant.dart';

class BookingDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(50.0);
  const BookingDetailsAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Booking Details',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: kPrimaryColor,
    );
  }
}
