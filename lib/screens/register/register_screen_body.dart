import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/screens/register/register_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
            onChanged: (value) => state.widget.user.fullname = value,
          ),
          const SizedBox(height: 15),
          _buildTextField(
            hint: 'Username',
            onChanged: (value) => state.widget.user.username = value,
          ),
          const SizedBox(height: 15),
          _buildTextField(
            hint: 'Email',
            onChanged: (value) => state.widget.user.email = value,
          ),
          const SizedBox(height: 15),
          _buildTextField(
            hint: 'Password',
            onChanged: (value) => state.widget.user.password = value,
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
              state.passwordSame = comparePassword();
            },
            isObscure: state.hidePassword,
            button: IconButton(
              onPressed: () => state.hidePassword = !state.hidePassword,
              icon: Icon(Icons.visibility),
            ),
          ),
          SizedBox(
            height: 25,
            child: state.passwordSame == null
                ? null
                : state.passwordSame
                    ? DefaultTextStyle(
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                        child: AnimatedTextKit(
                          pause: Duration(milliseconds: 0),
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText('Password matched!')
                          ],
                        ))
                    : DefaultTextStyle(
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                        child: AnimatedTextKit(
                          pause: Duration(milliseconds: 0),
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText('Password does not match')
                          ],
                        )),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColorDarker,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                minimumSize: Size(330.0, 35.0),
                textStyle:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              child: Text('REGISTER'),
              onPressed: () => onRegisterPressed()),
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

  onRegisterPressed() async {
    final _user =
        await state.widget.userservice.createNewUser(state.widget.user);

    if (_user == null)
      print('Regiter failed');
    else
      print('Register success');
  }

  bool comparePassword() {
    if (state.widget.user.password == state.confirmPassword)
      return true;
    else
      return false;
  }
}
