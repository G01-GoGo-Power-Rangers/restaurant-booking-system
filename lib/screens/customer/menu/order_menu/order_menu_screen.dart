import 'package:flutter/material.dart';

import 'order_menu_apbar.dart';
import 'order_menu_body.dart';

class OrderMenuScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => OrderMenuScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrderMenuAppBar(),
      body: OrderMenuBody(),
    );
  }
}
