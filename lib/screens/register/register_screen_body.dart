import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/screens/register/register_screen.dart';

class RegisterScreenBody extends StatelessWidget {
  final RegisterScreenState _state;

  RegisterScreenBody({state}) : _state = state;

  RegisterScreenState get state => _state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Register',
            style: TextStyle(fontSize: titleFont, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildTextField(
            hint: 'Full Name',
            onChanged: (value) => state.fullname = value,
          ),
          const SizedBox(height: 15),
          _buildTextField(
            hint: 'Username',
            onChanged: (value) => state.username = value,
          ),
          const SizedBox(height: 15),
          _buildTextField(
            hint: 'Email',
            onChanged: (value) => state.email = value,
          ),
          const SizedBox(height: 15),
          _buildTextField(
            hint: 'Password',
            onChanged: (value) => state.password = value,
            isObscure: state.hidePassword,
            button: IconButton(
              onPressed: () => state.hidePassword = !state.hidePassword,
              icon: Icon(Icons.visibility),
            ),
          ),
          const SizedBox(height: 15),
          _buildTextField(
            hint: 'Confirm Password',
            onChanged: (value) {
              state.confirmPassword = value;
              // comparePassword();
            },
            isObscure: state.hidePassword,
            button: IconButton(
              onPressed: () => state.hidePassword = !state.hidePassword,
              icon: Icon(Icons.visibility),
            ),
          ),
          Text(
            !state.passwordSame ? 'Password do not match' : '',
            style: TextStyle(
                fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: kPrimaryColorDarker,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              minimumSize: Size(330.0, 35.0),
              textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            child: Text('REGISTER'),
            onPressed: () {
              state.passwordSame = comparePassword();
            },
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/login'),
            child: Text(
              'Already registered?',
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildTextField({hint, isObscure = false, button, onChanged}) {
    return SizedBox(
      width: 330.0,
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(fontSize: 20.0),
        obscureText: isObscure,
        decoration: InputDecoration(
          suffixIcon: button,
          contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 15),
          filled: true,
          fillColor: Colors.white,
          labelText: hint,
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.white),
              borderRadius:
                  const BorderRadius.all(const Radius.circular(10.0))),
        ),
      ),
    );
  }

  bool comparePassword() {
    if (state.password == state.confirmPassword)
      return true;
    else
      return false;
  }
}
