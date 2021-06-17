import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/models/user.dart';
import 'package:restaurant_booking_system/screens/register/register_screen_body.dart';
import 'package:restaurant_booking_system/services/user_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();

  static Route route({user}) =>
      MaterialPageRoute(builder: (context) => RegisterScreen(user: user));

  final User _user;
  final userservice = UserService();

  RegisterScreen({user}) : _user = user;

  User get user => _user;
}

class RegisterScreenState extends State<RegisterScreen> {
  String _fullname = '';
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _hidePassword = true;
  bool _passwordSame;

  get fullname => _fullname;
  set fullname(value) => _fullname = value;
  get username => _username;
  set username(value) => _username = value;
  get email => _email;
  set email(value) => _email = value;
  get password => _password;
  set password(value) => _password = value;
  get confirmPassword => _confirmPassword;
  set confirmPassword(value) => _confirmPassword = value;
  get hidePassword => _hidePassword;
  set hidePassword(value) => setState(() => _hidePassword = value);
  get passwordSame => _passwordSame;
  set passwordSame(value) => setState(() => _passwordSame = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
      ),
      body: RegisterScreenBody(state: this),
    );
  }
}
