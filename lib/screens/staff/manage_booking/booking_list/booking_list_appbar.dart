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
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        'Booking List',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: kPrimaryColor,
      bottom: TabBar(
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        indicatorColor: kPrimaryColorDarker,
        tabs: <Widget>[
          Tab(
            child: Text(
              'New',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Tab(
              child: Text(
            'History',
            style: TextStyle(
              fontSize: 20,
            ),
          ))
        ],
      ),
    );
  }
}
