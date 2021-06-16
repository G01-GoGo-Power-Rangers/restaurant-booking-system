import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/services/user_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();

  static Route route() =>
      MaterialPageRoute(builder: (context) => LoginScreen());
}

class _LoginScreenState extends State<LoginScreen> {
  String _username = '';
  String _password = '';
  bool _hidePassword = true;
  bool _showErrorMsg = false;

  get username => _username;
  set username(value) => _username = value;
  get password => _password;
  set password(value) => _password = value;
  get hidePassword => _hidePassword;
  set hidePassword(value) => setState(() => _hidePassword = value);
  get showErrorMsg => _showErrorMsg;
  set showErrorMsg(value) => setState(() => _showErrorMsg = value);

  onLoginPressed() async {
    final _user = await UserService.getUserByLoginAndPassword(
        username: username, password: password);

    if (_user == null)
      showErrorMsg = !showErrorMsg;
    else
      print('success login');
    // Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 40),
            Text(
              'Login',
              style: TextStyle(
                fontSize: titleFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 310.0,
              child: TextField(
                onChanged: (value) => username = value,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(10.0))),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 310.0,
              child: TextField(
                onChanged: (value) => password = value,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () => hidePassword = !hidePassword,
                    icon: Icon(Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(10.0))),
                ),
                obscureText: hidePassword,
              ),
            ),
            Text(
              showErrorMsg ? 'Invalid username or password' : '',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColorDarker,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                minimumSize: Size(310.0, 35.0),
                textStyle:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              child: Text('LOGIN'),
              onPressed: () => onLoginPressed(),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/register'),
              child: Text(
                'Don\'t have an account?',
                style: TextStyle(fontSize: 20, color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
