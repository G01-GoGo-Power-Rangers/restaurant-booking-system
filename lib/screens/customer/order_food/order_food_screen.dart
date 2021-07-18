import 'package:flutter/material.dart';

import 'order_food_appbar.dart';
import 'order_food_body.dart';

class OrderFoodScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => OrderFoodScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: OrderFoodAppBar(),
      body: OrderFoodBody(),
    );
  }
}
