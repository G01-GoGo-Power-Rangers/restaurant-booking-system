import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/constant.dart';

class BookingListAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(100.0);
  const BookingListAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Booking List'),
      backgroundColor: kPrimaryColor,
      bottom: TabBar(
        tabs: <Widget>[
          Tab(
            text: 'New',
          ),
          Tab(
            text: 'History',
          )
        ],
      ),
    );
  }
}
