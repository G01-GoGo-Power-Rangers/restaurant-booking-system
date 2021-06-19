import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  static Route route() => MaterialPageRoute(builder: (context) => HomeScreen());
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: kPrimaryColor,
          title: Text(
            'Home',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Text('home'),
      ),
    );
  }
}
