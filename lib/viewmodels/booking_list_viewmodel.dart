import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/models/booking.dart';
import 'package:restaurant_booking_system/models/order.dart';
import 'package:restaurant_booking_system/services/booking_service.dart';
import 'package:restaurant_booking_system/services/order_service.dart';

import '../dependencies.dart';

class BookingListViewModel extends ChangeNotifier {
  List<Booking> _newBookingList = [];
  List<Booking> _historyBookingList = [];
  List<Booking> _customerBookingList = [];
  Order _userOrder;

  final bookingListService = service<BookingService>();
  final orderService = service<OrderService>();

  List<Booking> get newBookingList => _newBookingList;
  set newBookingList(value) => _newBookingList = value;

  List<Booking> get historyBookingList => _historyBookingList;
  set historyBookingList(value) => _historyBookingList = value;

  List<Booking> get customerBookingList => _customerBookingList;
  set customerBookingList(value) => _customerBookingList = value;

  Order get userOrder => _userOrder;
  set userOrder(value) => _userOrder = value;

  Future<List<Booking>> getNewBookingList() async {
    newBookingList = await bookingListService.getNewBookingList();

    return newBookingList;
  }

  Future<List<Booking>> getHistoryBookingList() async {
    historyBookingList = await bookingListService.getHistoryBookingList();

    return historyBookingList;
  }

  Future<List<Booking>> getCustomerBookingList() async {
    customerBookingList = await bookingListService.getBookingList();
    return customerBookingList;
  }

  Future<Order> getCustomerBookingByBookingId(String bookingId) async {
    userOrder = await orderService.getOrderByBookingid(bookingId);
    return userOrder;
  }

  onTapLogOut(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.pushNamedAndRemoveUntil(
        context, '/main', ModalRoute.withName('/booklist'));
  }

  onTapHome(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, '/booklist');
  }

  onTapConfirm(BuildContext context, String bookingid) async {
    await bookingListService.updateBookingStatus(bookingid);
    Navigator.pushNamed(context, '/booklist');
  }
}
