import 'package:flutter/cupertino.dart';
import 'package:restaurant_booking_system/models/user.dart';
import 'package:restaurant_booking_system/services/user_service.dart';

import '../dependencies.dart';

class RegisterViewModel extends ChangeNotifier {
  User _user = User();

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

  onRegisterPressed(BuildContext context) async {
    user.usertype = 'customer';
    user.photo =
        'https://firebasestorage.googleapis.com/v0/b/restaurant-booking-syste-a4ca7.appspot.com/o/other%2Fprofile-icon.png?alt=media&token=c4188847-a17d-4eae-8b96-d750f956cdd9';

    final _user = await userService.createNewUser(user);

    if (_user == null)
      print('Regiter failed');
    else
      Navigator.pushReplacementNamed(context, '/registersuccess');
  }

  bool comparePassword() {
    if (user.password == confirmPassword)
      return true;
    else
      return false;
  }
}
