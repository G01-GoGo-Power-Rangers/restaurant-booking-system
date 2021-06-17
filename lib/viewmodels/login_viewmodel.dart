import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/services/user_service.dart';

class LoginViewModel extends ChangeNotifier {
  String _username;
  String _password;
  bool _showErrorMsg = false;
  bool _hidePassword = true;

  final userservice = UserService();

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
    final _user = await userservice.getUserByLoginAndPassword(
        username: username, password: password);

    if (_user == null)
      showErrorMsg = !showErrorMsg;
    else {
      print('success login');
      showErrorMsg = !showErrorMsg;
      Navigator.pushNamed(context, '/home');
    }
  }
}
