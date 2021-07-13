import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/models/booking.dart';
import 'package:restaurant_booking_system/services/booking_service.dart';

import '../dependencies.dart';

class BookingListViewModel extends ChangeNotifier {
  List<Booking> _newBookingList = [];
  List<Booking> _historyBookingList = [];
  List<Booking> _customerBookingList = [];

  final bookingListService = service<BookingService>();

  List<Booking> get newBookingList => _newBookingList;
  set newBookingList(value) => _newBookingList = value;

  List<Booking> get historyBookingList => _historyBookingList;
  set historyBookingList(value) => _historyBookingList = value;

  List<Booking> get customerBookingList => _customerBookingList;
  set customerBookingList(value) => _customerBookingList = value;

  List<Widget> containers = <Widget>[
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
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text('Hasan'), subtitle: Text('Staff ${index + 1}')),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    ),
  ];

  List<Booking> nullFilBookingList(List<Booking> list) {
    list = [];
    list.add(Booking(
        id: '',
        date: DateTime.now(),
        person: "Received no data",
        time: DateTime.now(),
        price: 0,
        table: 'Received no data',
        userid: null));
  }

  Future<List<Booking>> getNewBookingList() async {
    _newBookingList = await bookingListService.getBookingList();
    if (_newBookingList == null)
      _newBookingList = nullFilBookingList(_newBookingList);
    // notifyListeners();
    // no data return after notifyListeners();
    // heeheheh

    return _newBookingList;
  }

  Future<List<Booking>> getHistoryBookingList() async {
    _customerBookingList = await bookingListService.getBookingList();
    if (_customerBookingList == null)
      _customerBookingList = nullFilBookingList(_customerBookingList);
    // notifyListeners();
    // no data return after notifyListeners();
    // heeheheh

    return _historyBookingList;
  }

  Future<List<Booking>> getCustomerBookingList() async {
    _customerBookingList = await bookingListService.getBookingList();
    if (_customerBookingList == null)
      _customerBookingList = nullFilBookingList(_customerBookingList);
    // notifyListeners();
    return _customerBookingList;
  }
}
