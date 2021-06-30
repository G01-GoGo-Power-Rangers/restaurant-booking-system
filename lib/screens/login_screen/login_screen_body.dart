import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:restaurant_booking_system/viewmodels/login_viewmodel.dart';

class LoginScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);

    return Center(
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
          Consumer<LoginViewModel>(
              // Username Textfield======
              builder: (_, notifier, __) => _buildTextField(
                    hint: 'Username',
                    onChanged: (value) => notifier.username = value,
                    isObscure: false,
                    notifier: notifier,
                    prefixIcon: Icon(Icons.person),
                  )),
          const SizedBox(height: 20),
          Consumer<LoginViewModel>(
              // Password textfield======
              builder: (_, notifier, __) => _buildTextField(
                    hint: 'Password',
                    onChanged: (value) => notifier.password = value,
                    isObscure: true,
                    notifier: notifier,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () => notifier.changeHidePassword(),
                        icon: Icon(Icons.visibility)),
                  )),
          SizedBox(
            height: 25,
            child: !loginViewModel.showErrorMsg
                ? null
                : DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                    child: AnimatedTextKit(
                      pause: Duration(milliseconds: 0),
                      repeatForever: true,
                      animatedTexts: [
                        RotateAnimatedText('Invalid username or password')
                      ],
                    )),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: kPrimaryColorDarker,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              minimumSize: Size(310.0, 35.0),
              textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            child: Text('LOGIN'),
            onPressed: () => loginViewModel.onLoginPressed(context),
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
    );
  }

  SizedBox _buildTextField(
      {hint, onChanged, prefixIcon, suffixIcon, isObscure, notifier}) {
    return SizedBox(
      width: 310.0,
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(fontSize: 20.0),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: isObscure ? suffixIcon : null,
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius:
                  const BorderRadius.all(const Radius.circular(10.0))),
        ),
        obscureText: isObscure ? notifier.hidePassword : isObscure,
      ),
    );
  }
}
