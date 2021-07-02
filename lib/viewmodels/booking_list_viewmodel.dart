import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/staff/manage_booking/booking_list/booking_list_body.dart';

class BookingListViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  List<Widget> pages = <Widget>[
    BookingListBody(
      containers: [],
    )
  ];
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

  void testContainers(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
