import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        backgroundColor: Colors.orange[200],
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 50.0,
        ),
        child: ElevatedButton(
          child: Text('MENU'),
          onPressed: () async {
            dynamic result = await _auth.loginAnon();

            if (result == null) {
              print('error login');
            } else {
              print('login success');
              print(result);
            }
          },
        ),
      ),
    );
  }
}
