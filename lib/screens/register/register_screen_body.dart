import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_booking_system/constant.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:restaurant_booking_system/viewmodels/register_viewmodel.dart';

class RegisterScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RegisterViewModel registerViewModel =
        Provider.of<RegisterViewModel>(context);

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
            onChanged: (value) => registerViewModel.user.fullname = value,
          ),
          const SizedBox(height: 15),
          _buildTextField(
            hint: 'Username',
            onChanged: (value) => registerViewModel.user.username = value,
          ),
          const SizedBox(height: 15),
          _buildTextField(
            hint: 'Email',
            onChanged: (value) => registerViewModel.user.email = value,
          ),
          const SizedBox(height: 15),
          Consumer<RegisterViewModel>(
            builder: (_, notifier, __) => _buildTextField(
              hint: 'Password',
              onChanged: (value) => notifier.user.password = value,
              isObscure: notifier.hidePassword,
              button: IconButton(
                onPressed: () => notifier.hidePassword = !notifier.hidePassword,
                icon: Icon(Icons.visibility),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Consumer<RegisterViewModel>(
              builder: (_, notifier, __) => _buildTextField(
                    hint: 'Confirm Password',
                    onChanged: (value) {
                      notifier.confirmPassword = value;
                      notifier.passwordSame = notifier.comparePassword();
                    },
                    isObscure: notifier.hidePassword,
                    button: IconButton(
                      onPressed: () =>
                          notifier.hidePassword = !notifier.hidePassword,
                      icon: Icon(Icons.visibility),
                    ),
                  )),
          SizedBox(
            height: 25,
            child: registerViewModel.passwordSame == null
                ? null
                : registerViewModel.passwordSame
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
              onPressed: () => registerViewModel.onRegisterPressed()),
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
}
