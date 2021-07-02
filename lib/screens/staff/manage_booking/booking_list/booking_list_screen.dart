// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/staff/manage_booking/booking_list/booking_list_body.dart';

import 'booking_list_appbar.dart';

class BookingListScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => BookingListScreen());

  List<Widget> containers = [
    Container(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text('arif'), subtitle: Text('Staff ${index + 1}')),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: 2),
    ),
    Container(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text('Hasan'), subtitle: Text('Staff ${index + 1}')),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: 1),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: BookingListAppBar(),
            body: BookingListBody(containers: containers)));
  }
}
