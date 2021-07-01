import 'package:flutter/cupertino.dart';
import 'package:restaurant_booking_system/models/user.dart';
import 'package:restaurant_booking_system/services/user_service.dart';

import '../dependencies.dart';

class RegisterViewModel extends ChangeNotifier {
  User _user = User();
  // Order _order = Order(
  //     id: 'aasdasdasdasda',
  //     bookingid: 'altgauwizxbviug',
  //     foods: [
  //       {"name": "nasi lemak", "quantity": 5},
  //       {"name": "nasi goreng", "quantity": 4}
  //     ],
  //     totalPrice: 150.0);

  final UserService userService = service();

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
