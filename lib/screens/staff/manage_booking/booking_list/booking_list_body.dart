import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/viewmodels/booking_list_viewmodel.dart';

class BookingListBody extends StatelessWidget {
  const BookingListBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookingListViewModel bookingListViewModel =
        Provider.of<BookingListViewModel>(context);

    return TabBarView(
      children: bookingListViewModel.containers,
    );
  }
}
