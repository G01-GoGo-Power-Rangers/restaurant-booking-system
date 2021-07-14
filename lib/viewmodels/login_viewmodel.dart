import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/models/user.dart';
import 'package:restaurant_booking_system/services/user_service.dart';

import '../dependencies.dart';

class LoginViewModel extends ChangeNotifier {
  String _username;
  String _password;
  bool _showErrorMsg = false;
  bool _hidePassword = true;
  User _user;

  final userService = service<UserService>();
  // final UserService userService = service(); //same with declare

  User get user => _user;
  set user(value) => _user = value;

  get username => _username;
  set username(value) => _username = value;
  get password => _password;
  set password(value) => _password = value;
  get showErrorMsg => _showErrorMsg;
  set showErrorMsg(value) {
    _showErrorMsg = value;
    notifyListeners();
  }

  get hidePassword => _hidePassword;
  changeHidePassword() {
    _hidePassword = !_hidePassword;
    notifyListeners();
  }

  onLoginPressed(BuildContext context) async {
    user = await userService.getUserByLoginAndPassword(
        username: username, password: password);

    if (user == null)
      showErrorMsg = true;
    else if (user.usertype == 'staff') {
      showErrorMsg = false;
      Navigator.pushNamedAndRemoveUntil(
          context, '/booklist', ModalRoute.withName('/main'));
    } else {
      showErrorMsg = false;
      Navigator.pushNamedAndRemoveUntil(
          context, '/home', ModalRoute.withName('/main'));
    }
  }

  void onTapLogOut(BuildContext context) {
    user = null;
    Navigator.pushNamedAndRemoveUntil(
        context, '/main', ModalRoute.withName('/home'));
  }
}
