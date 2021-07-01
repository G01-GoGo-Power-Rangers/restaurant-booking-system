import 'package:flutter/cupertino.dart';
import 'package:restaurant_booking_system/models/user.dart';
import 'package:restaurant_booking_system/services/user_service.dart';

import '../dependencies.dart';

class RegisterViewModel extends ChangeNotifier {
  User _user = User();
  // Order _order = Order(
  //     id: 'vbncvbcvbnvcbn',
  //     bookingid: 'oeruqytdfgblaiurgm',
  //     foods: [
  //       {"name": "nasi lemak 2", "quantity": 10},
  //       {"name": "nasi goreng 2", "quantity": 90}
  //     ],
  //     totalPrice: 1000.69);

  // Booking _booking = Booking(
  //   date: DateTime.now().toString(),
  //   person: 3,
  //   price: 50.34,
  //   status: 'processed',
  //   table: '6',
  //   time: DateTime.now().toString(),
  //   userid: 'IOHvgzNPnxBvExKK0CAt',
  // );

  final UserService userService = service();
  // final OrderService orderService = service();
  // final BookingService bookingService = service();

  String _confirmPassword = '';
  bool _hidePassword = true;
  bool _passwordSame;

  User get user => _user;

  get confirmPassword => _confirmPassword;
  set confirmPassword(value) => _confirmPassword = value;
  get hidePassword => _hidePassword;
  set hidePassword(value) {
    _hidePassword = value;
    notifyListeners();
  }

  get passwordSame => _passwordSame;
  set passwordSame(value) {
    _passwordSame = value;
    notifyListeners();
  }

  onRegisterPressed() async {
    user.usertype = 'customer';

    final _user = await userService.createNewUser(user);

    if (_user == null)
      print('Regiter failed');
    else
      print('Register success');

    //all this comment only for testing================================
    // final List<Booking> bookingList = await bookingService.getBookingList();
    // print(bookingList[0].userid);

    // final List<Booking> userBookingList =
    //     await bookingService.getUserBookingList('IOHvgzNPnxBvExKK0CAt');
    // print(userBookingList[0].status);

    // final Order neworder = await orderService.createnewOrder(_order);
    // print(neworder.id);

    // final Order userOrder =
    //     await orderService.getOrderByBookingid('IOHvgzNPnxBvExKK0CAt');
    // print(userOrder.id);
    // print(userOrder.foods[0]['name']);

    // final Booking booking = await bookingService.createNewBooking(_booking);
    // print(booking);
    // print(DateTime.now().toString());

    // final stringOrder = jsonEncode(_order);
    // print(stringOrder);
    // print(stringOrder.length);
    // print(_order.foods[0]['name']);
  }

  bool comparePassword() {
    if (user.password == confirmPassword)
      return true;
    else
      return false;
  }
}
