import 'package:flutter/material.dart';
import 'package:restaurant_booking_system/screens/customer/menu/cart/cart_body.dart';
import 'cart_appbar.dart';
import 'cart_bottom_nav.dart';

class CartScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (context) => CartScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBar(),
      body: CartBody(),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}
