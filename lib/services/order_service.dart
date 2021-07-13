import 'package:restaurant_booking_system/models/order.dart';

import '../dependencies.dart';
import 'rest.dart';

class OrderService {
  final restService = service<Rest>();

  Future<Order> createnewOrder(Order order) async {
    final json = await restService.post('orders/neworder', data: order);
    if (json == null) return null;
    return Order.fromJson(json);
  }

  Future<Order> getOrderByBookingid(String bookingid) async {
    final json = await restService.get('orders/userorder/$bookingid');
    if (json == null) return null;
    return Order.fromJson(json);
  }
}
