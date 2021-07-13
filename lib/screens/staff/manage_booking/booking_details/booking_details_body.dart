import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/models/booking.dart';
import 'package:restaurant_booking_system/screens/staff/manage_booking/booking_details/booking_details_screen.dart';
import 'package:restaurant_booking_system/viewmodels/booking_list_viewmodel.dart';

class BookingDetailsBody extends StatelessWidget {
  BookingDetailsBody({Key key, Booking state})
      : _state = state,
        super(key: key);
  Booking _state;
  Booking get state => _state;

  // final List<String> details = [
  //   'Arif Masyhur',
  //   'Date: 6/9/2021',
  //   'Time: 12.00pm',
  //   'Table No: A3'
  // ];

  // @override
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      ListTile(
        title: Text('Name: ${_state.person}'),
      ),
      Divider(),
      ListTile(
        title: Text('Date: ${_state.date}'),
      ),
      Divider(),
      ListTile(
        title: Text('Time: ${_state.time}'),
      ),
      Divider(),
      ListTile(
        title: Text('Table No: ${_state.table}'),
      ),
      Divider(),
    ]);
  }
}
