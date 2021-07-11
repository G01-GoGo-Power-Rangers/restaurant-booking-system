import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/constant.dart';

class BookingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookingAppBar({Key key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        'Booking',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: kPrimaryColor,
    );
  }
}
