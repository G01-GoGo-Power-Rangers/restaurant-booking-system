import 'package:flutter/material.dart';

import '../../../../constant.dart';

class BookingListBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(100.0);
  const BookingListBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Manage Booking'),
          backgroundColor: kPrimaryColor,
          bottom: TabBar(
            tabs: [Tab(text: 'New'), Tab(text: 'History')],
          ),
        ),
      ),
    );
  }
}
