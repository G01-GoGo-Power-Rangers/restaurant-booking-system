import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/customer/menu/view_menu/view_menu_appbar.dart';
import 'package:restaurant_booking_system/screens/customer/menu/view_menu/view_menu_body.dart';

class MenuScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (context) => MenuScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewMenuAppBar(),
      body: ViewMenuBody(),
    );
  }
}
