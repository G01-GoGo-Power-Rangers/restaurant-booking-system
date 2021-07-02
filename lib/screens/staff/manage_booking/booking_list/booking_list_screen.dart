// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/screens/staff/manage_booking/booking_list/booking_list_body.dart';
import 'package:restaurant_booking_system/viewmodels/booking_list_viewmodel.dart';

import 'booking_list_appbar.dart';

class BookingListScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => BookingListScreen());

  @override
  Widget build(BuildContext context) {
    BookingListViewModel bookingListViewModel =
        Provider.of<BookingListViewModel>(context);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: BookingListAppBar(),
            body: bookingListViewModel.containers
                .elementAt(bookingListViewModel.selectedIndex)));
  }
}
